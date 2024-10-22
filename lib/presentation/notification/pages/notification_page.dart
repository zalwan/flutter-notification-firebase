import 'package:flutter/material.dart';
import 'package:notification_sample/presentation/notification/services/notification_service.dart';
import '../models/notification_model.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late NotificationServices _notificationServices;
  List<NotificationModel> _notifications = [];

  @override
  void initState() {
    super.initState();
    _notificationServices = NotificationServices(
      onNotificationTap: _handleNotificationTap,
    );
    _loadNotifications();
  }

  void _handleNotificationTap(String? payload) {
    // Handle notification tap if needed
    print('Notification tapped with payload: $payload');
    // You can add additional logic here if needed
  }

  Future<void> _loadNotifications() async {
    final notifications = await _notificationServices.getNotifications();
    setState(() {
      _notifications = notifications;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return ListTile(
            title: Text(notification.title),
            subtitle: Text(notification.body),
            trailing: Text(
              '${notification.timestamp.day}/${notification.timestamp.month}/${notification.timestamp.year}',
            ),
            onTap: () async {
              await _notificationServices
                  .markNotificationAsRead(notification.id);
              setState(() {
                notification.isRead = true;
              });
            },
            tileColor: notification.isRead ? null : Colors.grey[200],
          );
        },
      ),
    );
  }
}
