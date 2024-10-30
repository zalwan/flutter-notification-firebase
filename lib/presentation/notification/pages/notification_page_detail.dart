import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notification_sample/presentation/notification/models/notification_model.dart';

class NotificationPageDetail extends StatelessWidget {
  final NotificationModel notification;

  const NotificationPageDetail({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              notification.body,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Received on: ${DateFormat('dd MMM yyyy • HH:mm').format(notification.timestamp)}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
