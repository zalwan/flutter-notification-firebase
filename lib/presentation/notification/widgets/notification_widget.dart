import 'package:flutter/material.dart';
import '../models/notification_model.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;

  const NotificationWidget({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(notification.title),
      subtitle: Text(notification.body),
      trailing: Text(
        '${notification.timestamp.day}/${notification.timestamp.month}/${notification.timestamp.year}',
      ),
      leading: Icon(
        Icons.circle,
        color: notification.isRead ? Colors.grey : Colors.blue,
        size: 12,
      ),
      onTap: onTap,
    );
  }
}
