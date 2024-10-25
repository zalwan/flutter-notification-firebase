import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';
import 'package:notification_sample/presentation/notification/models/notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseMessagingService {
  static final FirebaseMessagingService _instance =
      FirebaseMessagingService._internal();
  factory FirebaseMessagingService() => _instance;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final List<NotificationModel> _notifications = [];
  static const String NOTIFICATIONS_KEY = 'notifications_data';

  List<NotificationModel> get notifications => _notifications;
  static FirebaseMessagingService get instance => _instance;

  FirebaseMessagingService._internal();

  Future<void> initialize() async {
    await _requestPermission();
    await _loadNotificationsFromStorage();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((message) async {
      await _addNotification(message, source: "Foreground");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      await _addNotification(message, source: "Opened");
    });

    print('FCM Token: ${await _firebaseMessaging.getToken()}');
  }

  Future<void> _loadNotificationsFromStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? notificationsJson = prefs.getString(NOTIFICATIONS_KEY);

      if (notificationsJson != null) {
        final List<dynamic> decodedList = jsonDecode(notificationsJson);
        _notifications.clear();
        _notifications.addAll(decodedList
            .map((item) => NotificationModel.fromJson(item))
            .toList());
      }
    } catch (e) {
      print('Error loading notifications: $e');
    }
  }

  Future<void> _saveNotificationsToStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String notificationsJson = jsonEncode(
          _notifications.map((notification) => notification.toJson()).toList());
      await prefs.setString(NOTIFICATIONS_KEY, notificationsJson);
      print('Notifications saved successfully');
    } catch (e) {
      print('Error saving notifications: $e');
    }
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    try {
      await Firebase.initializeApp();

      // Load existing notifications
      final prefs = await SharedPreferences.getInstance();
      final String? notificationsJson = prefs.getString(NOTIFICATIONS_KEY);
      List<NotificationModel> notifications = [];

      if (notificationsJson != null) {
        final List<dynamic> decodedList = jsonDecode(notificationsJson);
        notifications = decodedList
            .map((item) => NotificationModel.fromJson(item))
            .toList();
      }

      // Add new notification
      notifications.add(NotificationModel(
        id: message.messageId ?? DateTime.now().toString(),
        title: message.notification?.title ?? 'No Title',
        body: message.notification?.body ?? 'No Body',
        timestamp: DateTime.now(),
        isRead: false,
      ));

      // Save back to SharedPreferences
      final String updatedNotificationsJson = jsonEncode(
          notifications.map((notification) => notification.toJson()).toList());
      await prefs.setString(NOTIFICATIONS_KEY, updatedNotificationsJson);

      print('Background notification saved successfully');
      _printMessageDetails("Background", message);
    } catch (e) {
      print('Error in background handler: $e');
    }
  }

  Future<void> _addNotification(RemoteMessage message,
      {required String source}) async {
    try {
      String title = message.notification?.title ?? 'No Title';
      String body = message.notification?.body ?? 'No Body';

      _notifications.add(NotificationModel(
        id: message.messageId ?? DateTime.now().toString(),
        title: title,
        body: body,
        timestamp: DateTime.now(),
        isRead: false,
      ));

      await _saveNotificationsToStorage();
      print('$source notification saved successfully');
      _printMessageDetails(source, message);
    } catch (e) {
      print('Error adding notification: $e');
    }
  }

  Future<void> markAsRead(String notificationId) async {
    try {
      final index = _notifications
          .indexWhere((notification) => notification.id == notificationId);
      if (index != -1) {
        final updatedNotification =
            _notifications[index].copyWith(isRead: true);
        _notifications[index] = updatedNotification;
        await _saveNotificationsToStorage();
      }
    } catch (e) {
      print('Error marking notification as read: $e');
    }
  }

  Future<void> deleteNotification(String notificationId) async {
    try {
      _notifications
          .removeWhere((notification) => notification.id == notificationId);
      await _saveNotificationsToStorage();
    } catch (e) {
      print('Error deleting notification: $e');
    }
  }

  Future<void> clearAllNotifications() async {
    try {
      _notifications.clear();
      await _saveNotificationsToStorage();
    } catch (e) {
      print('Error clearing notifications: $e');
    }
  }

  static void _printMessageDetails(String source, RemoteMessage message) {
    print('$source Message ID: ${message.messageId}');
    if (message.notification != null) {
      print(
          '$source Notification Title: ${message.notification?.title ?? 'No Title'}');
      print(
          '$source Notification Body: ${message.notification?.body ?? 'No Body'}');
    }
  }
}
