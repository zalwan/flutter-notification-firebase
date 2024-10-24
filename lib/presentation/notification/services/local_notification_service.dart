import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _notifications;
  final Random _random = Random();
  final Function(NotificationResponse) onNotificationResponse;

  LocalNotificationService({
    required this.onNotificationResponse,
  }) : _notifications = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: onNotificationResponse,
    );
  }

  Future<void> showNotification(RemoteMessage message) async {
    const androidDetails = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const notificationDetails = NotificationDetails(android: androidDetails);

    final id = _random.nextInt(pow(2, 31).toInt() - 1);

    await _notifications.show(
      id,
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      notificationDetails,
      payload: message.data['route'],
    );
  }
}
