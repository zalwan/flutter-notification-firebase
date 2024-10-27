import 'package:flutter/material.dart';
import 'package:notification_sample/services/firebase/firebase_messaging_service.dart';

bool isNotificationPageActive = false;

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final firebaseMessagingService = FirebaseMessagingService();

  @override
  void initState() {
    super.initState();

    isNotificationPageActive = true;
  }

  @override
  void dispose() {
    isNotificationPageActive = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: firebaseMessagingService.notifications.length,
        itemBuilder: (context, index) {
          final notification = firebaseMessagingService.notifications[index];

          return ListTile(
            title: Text(notification.title),
            subtitle: Text(notification.body),
            trailing: Text(
              notification.timestamp.toLocal().toString(),
              style: const TextStyle(fontSize: 12),
            ),
          );
        },
      ),
    );
  }
}
