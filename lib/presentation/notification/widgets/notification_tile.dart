import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notification_sample/presentation/notification/bloc/notification_bloc.dart';
import 'package:notification_sample/presentation/notification/models/notification_model.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;
  final bool isDeleting;
  final bool isSelected;
  final Function(String, bool?) onToggleSelection;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.isDeleting,
    required this.isSelected,
    required this.onToggleSelection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading:
              const Icon(Icons.notifications_active, color: Colors.blueAccent),
          tileColor: notification.isRead ? Colors.white : Colors.grey[100],
          title: _buildTitle(),
          subtitle: _buildSubtitle(),
          trailing: _buildTrailing(),
          onTap: () => _handleTap(context),
        ),
        const Divider(
          color: Colors.grey,
          height: 1,
          thickness: 0.5,
          indent: 16,
          endIndent: 16,
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Info',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              DateFormat('dd MMM yyyy • HH:mm').format(notification.timestamp),
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 13,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          notification.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildSubtitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notification.body,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget? _buildTrailing() {
    if (!isDeleting) return null;

    return Checkbox(
      value: isSelected,
      onChanged: (value) => onToggleSelection(notification.id, value),
    );
  }

  void _handleTap(BuildContext context) {
    if (!notification.isRead) {
      context.read<NotificationBloc>().add(
            NotificationEvent.markAsRead(notification.id),
          );
    }
  }
}
