import 'package:flutter/material.dart';
import 'package:notification_sample/presentation/notification/models/notification_model.dart';
import 'notification_tile.dart';

class NotificationList extends StatelessWidget {
  final List<NotificationModel> notifications;
  final bool isDeleting;
  final List<String> selectedIds;
  final Function(String, bool?) onToggleSelection;

  const NotificationList({
    super.key,
    required this.notifications,
    required this.isDeleting,
    required this.selectedIds,
    required this.onToggleSelection,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return NotificationTile(
          notification: notification,
          isDeleting: isDeleting,
          isSelected: selectedIds.contains(notification.id),
          onToggleSelection: onToggleSelection,
        );
      },
    );
  }
}
