// lib/presentation/notification/pages/notification_page.dart
import 'package:flutter/material.dart';
import 'package:notification_sample/services/firebase/firebase_messaging_service.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseMessagingService = FirebaseMessagingService();

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
              notification.timestamp
                  .toLocal()
                  .toString(), // Tampilkan timestamp
              style: TextStyle(fontSize: 12),
            ),
          );
        },
      ),
    );
  }
}
