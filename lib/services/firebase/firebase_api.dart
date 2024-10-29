import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_sample/main.dart';
import 'package:notification_sample/presentation/notification/bloc/notification_bloc.dart';
import 'package:notification_sample/presentation/notification/models/notification_model.dart';
import 'package:notification_sample/presentation/notification/pages/notification_page.dart';
import 'package:notification_sample/presentation/notification/services/notification_storage_service.dart';

@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  if (kDebugMode) {
    print("From Background");
    print("Title: ${message.notification?.title}");
    print("Body: ${message.notification?.body}");
    print("Payload: ${message.data}");
  }

  final notificationStorageService = NotificationStorageService();
  final notificationId =
      message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString();

  if (!await notificationStorageService.notificationExists(notificationId)) {
    notificationStorageService.saveNotification(NotificationModel(
      id: notificationId,
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      timestamp: DateTime.now(),
      isRead: false,
    ));
  }

  final context = navigatorKey.currentContext;
  if (context != null) {
    BlocProvider.of<NotificationBloc>(context)
        .add(NotificationEvent.newNotification(NotificationModel(
      id: notificationId,
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      timestamp: DateTime.now(),
      isRead: false,
    )));
  }
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.defaultImportance,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();
  final NotificationStorageService _notificationStorageService =
      NotificationStorageService();

  void handlePushMessage(RemoteMessage? message) async {
    if (kDebugMode) {
      print("From Foreground");
      print("Title: ${message?.notification?.title}");
      print("Body: ${message?.notification?.body}");
      print("Payload: ${message?.data}");
    }
    if (message == null) return;

    final notificationId =
        message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString();

    if (!await _notificationStorageService.notificationExists(notificationId)) {
      final notificationModel = NotificationModel(
        id: notificationId,
        title: message.notification?.title ?? '',
        body: message.notification?.body ?? '',
        timestamp: DateTime.now(),
        isRead: false,
      );

      _notificationStorageService.saveNotification(notificationModel);

      final context = navigatorKey.currentContext;
      if (context != null) {
        BlocProvider.of<NotificationBloc>(context)
            .add(NotificationEvent.newNotification(notificationModel));

        navigatorKey.currentState?.pushNamed(NotificationPage.route);
      }
    }
  }

  Future initLocalNotifications() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(iOS: iOS, android: android);

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {
        final payload = details.payload;
        if (payload != null) {
          final message = RemoteMessage.fromMap(jsonDecode(payload));
          handlePushMessage(message);

          navigatorKey.currentState?.pushNamed(NotificationPage.route);
        }
      },
    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platform?.createNotificationChannel(_androidChannel);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handlePushMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handlePushMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) async {
      final notification = message.notification;
      if (notification == null) return;

      final notificationId =
          message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString();

      if (!await _notificationStorageService
          .notificationExists(notificationId)) {
        final notificationModel = NotificationModel(
          id: notificationId,
          title: notification.title ?? '',
          body: notification.body ?? '',
          timestamp: DateTime.now(),
          isRead: false,
        );

        _notificationStorageService.saveNotification(notificationModel);

        final context = navigatorKey.currentContext;
        if (context != null) {
          BlocProvider.of<NotificationBloc>(context)
              .add(NotificationEvent.newNotification(notificationModel));

          // navigatorKey.currentState?.pushNamed(
          //   NotificationPage.route,
          // );
        }
      }

      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@drawable/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fTOKEN = await _firebaseMessaging.getToken();
    if (kDebugMode) {
      print("FCM TOKEN: $fTOKEN");
    }
    initPushNotifications();
    initLocalNotifications();
  }
}
