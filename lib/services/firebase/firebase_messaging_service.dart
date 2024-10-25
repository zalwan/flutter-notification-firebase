import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notification_sample/presentation/notification/models/notification_model.dart';

class FirebaseMessagingService {
  static final FirebaseMessagingService _instance =
      FirebaseMessagingService._internal();
  factory FirebaseMessagingService() => _instance;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final List<NotificationModel> _notifications = [];

  List<NotificationModel> get notifications => _notifications;

  FirebaseMessagingService._internal();

  Future<void> initialize() async {
    await _requestPermission();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((message) {
      _addNotification(message, source: "Foreground");
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _addNotification(message, source: "Opened");
    });
    print('FCM Token: ${await _firebaseMessaging.getToken()}');
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
    await Firebase.initializeApp();
    _instance._addNotification(message, source: "Background");
  }

  void _addNotification(RemoteMessage message, {required String source}) {
    String title = message.notification?.title ?? 'No Title';
    String body = message.notification?.body ?? 'No Body';

    _notifications.add(NotificationModel(
      id: message.messageId ?? DateTime.now().toString(),
      title: title,
      body: body,
      timestamp: DateTime.now(),
      isRead: false,
    ));

    _printMessageDetails(source, message);
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
