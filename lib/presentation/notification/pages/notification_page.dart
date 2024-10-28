import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const route = '/notification-page';

  @override
  Widget build(BuildContext context) {
    final message =
        ModalRoute.of(context)!.settings.arguments as RemoteMessage?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification History'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Title: ${message?.notification?.title ?? "No Title"}'),
            Text('Body: ${message?.notification?.body ?? "No Body"}'),
            Text('Payload: ${message?.data.toString() ?? "No Payload"}'),
          ],
        ),
      ),
    );
  }
}
