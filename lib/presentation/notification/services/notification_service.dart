import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notification_sample/presentation/notification/services/local_notification_service.dart';
import 'package:notification_sample/presentation/notification/services/notification_storage_service.dart';
import '../models/notification_model.dart';

class NotificationServices {
  final LocalNotificationService _localNotificationService;
  final NotificationStorageService _storageService;
  final FirebaseMessaging _firebaseMessaging;
  final Function(String?) onNotificationTap;

  NotificationServices({
    required this.onNotificationTap,
  })  : _firebaseMessaging = FirebaseMessaging.instance,
        _localNotificationService = LocalNotificationService(
          onNotificationResponse: (response) =>
              onNotificationTap(response.payload),
        ),
        _storageService = NotificationStorageService();

  Future<void> init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    await _localNotificationService.init();

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessage);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    await Future.wait([
      _localNotificationService.showNotification(message),
      _saveNotification(message),
    ]);
  }

  Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    await _saveNotification(message);
  }

  Future<void> _saveNotification(RemoteMessage message) async {
    final notification = NotificationModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      timestamp: DateTime.now(),
      isRead: false,
    );

    await _storageService.saveNotification(notification);
  }

  Future<List<NotificationModel>> getNotifications() {
    return _storageService.getNotifications();
  }

  Future<int> getUnreadNotificationCount() async {
    final notifications = await _storageService.getNotifications();
    return notifications.where((notification) => !notification.isRead).length;
  }

  Future<void> markNotificationAsRead(String id) {
    return _storageService.markAsRead(id);
  }

  Future<void> deleteAllNotifications() {
    return _storageService.deleteAll();
  }

  Future<void> deleteNotification(String id) {
    return _storageService.deleteNotification(id);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final storageService = NotificationStorageService();
  final notification = NotificationModel(
    id: DateTime.now().millisecondsSinceEpoch.toString(),
    title: message.notification?.title ?? '',
    body: message.notification?.body ?? '',
    timestamp: DateTime.now(),
    isRead: false,
  );

  await storageService.saveNotification(notification);
}
