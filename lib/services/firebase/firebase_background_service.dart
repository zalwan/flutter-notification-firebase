import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notification_sample/presentation/notification/models/notification_model.dart';

class FirebaseBackgroundService {
  static bool _isHandlerRegistered = false;

  Future<void> initialize() async {
    if (_isHandlerRegistered) {
      print("Handler sudah terdaftar, tidak perlu mendaftar lagi.");
      return; // Cegah pendaftaran ganda
    }
    print("Mendaftar handler latar belakang...");
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    _isHandlerRegistered = true; // Tandai bahwa handler sudah terdaftar
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Menangani pesan latar belakang: ${message.messageId}");

    NotificationModel notificationModel = NotificationModel(
      id: message.messageId ?? DateTime.now().toString(),
      title: message.notification?.title ?? 'No Title',
      body: message.notification?.body ?? 'No Body',
      timestamp: DateTime.now(),
    );

    print('Notifikasi di latar belakang: ${notificationModel.toJson()}');
  }
}
