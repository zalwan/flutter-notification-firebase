import 'dart:convert';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_sample/presentation/notification/models/notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationServices {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final Random _random = Random();

  final Function(String?) onNotificationTap;

  NotificationServices({required this.onNotificationTap});

  // Generate safe notification ID (between 0 and 2^31-1)
  int _generateNotificationId() {
    return _random.nextInt(pow(2, 31).toInt() - 1);
  }

  Future<void> init() async {
    await _firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        _handleNotificationTap(response.payload);
      },
    );
  }

  void _handleNotificationTap(String? payload) {
    onNotificationTap(payload);
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    await Future.wait([
      _showLocalNotification(message),
      _saveNotification(message),
    ]);
  }

  Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    await _saveNotification(message);
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    final notificationId = _generateNotificationId();
    await _flutterLocalNotificationsPlugin.show(
      notificationId,
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      platformChannelSpecifics,
      payload: message.data['route'],
    );
  }

  Future<void> _saveNotification(RemoteMessage message) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Create new notification model
      final newNotification = NotificationModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: message.notification?.title ?? '',
        body: message.notification?.body ?? '',
        timestamp: DateTime.now(),
        isRead: false,
      );

      // Get existing notifications
      final String notificationsJson = prefs.getString('notifications') ?? '[]';
      final List<dynamic> existingNotifications = jsonDecode(notificationsJson);

      // Convert existing notifications to List<NotificationModel>
      final List<NotificationModel> notifications = [
        newNotification,
        ...existingNotifications.map(
            (json) => NotificationModel.fromJson(json as Map<String, dynamic>)),
      ];

      // Save updated notifications list
      await prefs.setString(
        'notifications',
        jsonEncode(notifications.map((n) => n.toJson()).toList()),
      );
    } catch (e) {
      print('Error saving notification: $e');
    }
  }

  Future<List<NotificationModel>> getNotifications() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String notificationsJson = prefs.getString('notifications') ?? '[]';
      final List<dynamic> notifications = jsonDecode(notificationsJson);

      return notifications
          .map((json) =>
              NotificationModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting notifications: $e');
      return [];
    }
  }

  Future<int> getUnreadNotificationCount() async {
    try {
      final notifications = await getNotifications();
      return notifications.where((notification) => !notification.isRead).length;
    } catch (e) {
      print('Error getting unread notification count: $e');
      return 0;
    }
  }

  Future<void> markNotificationAsRead(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final notifications = await getNotifications();

      final updatedNotifications = notifications.map((notification) {
        if (notification.id == id) {
          return notification.copyWith(isRead: true);
        }
        return notification;
      }).toList();

      await prefs.setString(
        'notifications',
        jsonEncode(updatedNotifications.map((n) => n.toJson()).toList()),
      );
    } catch (e) {
      print('Error marking notification as read: $e');
    }
  }

  Future<void> deleteAllNotifications() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('notifications');
    } catch (e) {
      print('Error deleting all notifications: $e');
    }
  }

  Future<void> deleteNotification(String id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final notifications = await getNotifications();

      final updatedNotifications =
          notifications.where((n) => n.id != id).toList();

      await prefs.setString(
        'notifications',
        jsonEncode(updatedNotifications.map((n) => n.toJson()).toList()),
      );
    } catch (e) {
      print('Error deleting notification: $e');
    }
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final notificationServices =
      NotificationServices(onNotificationTap: (payload) {
    print('Background message received: $payload');
  });
  await notificationServices._saveNotification(message);
}
