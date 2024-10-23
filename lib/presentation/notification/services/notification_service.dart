import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/notification_model.dart';

class NotificationServices {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final Function(String?) onNotificationTap;

  NotificationServices({required this.onNotificationTap});

  Future<void> init() async {
    // Request permission
    await _firebaseMessaging.requestPermission();

    // Configure FCM listeners
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Initialize local notifications
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
    await _showLocalNotification(message);
    await _saveNotification(message);
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

    await _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      platformChannelSpecifics,
      payload: message.data['route'],
    );
  }

  Future<void> _saveNotification(RemoteMessage message) async {
    final prefs = await SharedPreferences.getInstance();
    final notificationModel = NotificationModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      timestamp: DateTime.now(),
    );

    final String notificationsJson = prefs.getString('notifications') ?? '[]';
    final List<dynamic> notifications = jsonDecode(notificationsJson);
    notifications.add(notificationModel.toJson());
    await prefs.setString('notifications', jsonEncode(notifications));
  }

  Future<List<NotificationModel>> getNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final String notificationsJson = prefs.getString('notifications') ?? '[]';
    final List<dynamic> notifications = jsonDecode(notificationsJson);
    return notifications
        .map((notification) => NotificationModel.fromJson(notification))
        .toList();
  }

  Future<int> getUnreadNotificationCount() async {
    final notifications = await getNotifications();
    return notifications.where((notification) => !notification.isRead).length;
  }

  Future<void> markNotificationAsRead(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final String notificationsJson = prefs.getString('notifications') ?? '[]';
    final List<dynamic> notifications = jsonDecode(notificationsJson);
    final updatedNotifications = notifications.map((notification) {
      final notificationModel = NotificationModel.fromJson(notification);
      if (notificationModel.id == id) {
        return notificationModel.copyWith(isRead: true);
      }
      return notificationModel.toJson();
    }).toList();
    await prefs.setString('notifications', jsonEncode(updatedNotifications));
  }

  Future<void> deleteAllNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('notifications');
  }

  Future<void> deleteNotification(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final String notificationsJson = prefs.getString('notifications') ?? '[]';
    final List<dynamic> notifications = jsonDecode(notificationsJson);
    final updatedNotifications = notifications.where((notification) {
      final notificationModel = NotificationModel.fromJson(notification);
      return notificationModel.id != id;
    }).toList();
    await prefs.setString('notifications', jsonEncode(updatedNotifications));
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final notificationServices =
      NotificationServices(onNotificationTap: (payload) {
    print('Background message received: $payload');
  });
  await notificationServices._saveNotification(message);
}
