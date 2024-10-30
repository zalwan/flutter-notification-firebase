import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notification_sample/presentation/notification/bloc/notification_bloc.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  static const route = '/notification-page';

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> selectedNotificationIds = [];
  bool isDeleting = false;

  @override
  Widget build(BuildContext context) {
    context
        .read<NotificationBloc>()
        .add(const NotificationEvent.getNotifications());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              _showBottomDialog(context);
            },
          ),
        ],
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return state.map(
            initial: (_) =>
                const Center(child: Text('Welcome to Notifications')),
            loading: (_) => const Center(child: CircularProgressIndicator()),
            loaded: (loadedState) {
              final notifications = loadedState.notifications;
              return ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return ListTile(
                    leading: const Icon(Icons.notifications_active),
                    tileColor:
                        notification.isRead ? Colors.white : Colors.grey[200],
                    title: Column(
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
                              ),
                            ),
                            Text(
                              DateFormat('dd MMM yyyy • HH:mm')
                                  .format(notification.timestamp),
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          notification.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 2),
                        Text(notification.body),
                        const SizedBox(height: 8),
                        const Divider(
                          height: 0,
                          thickness: 0,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    trailing: isDeleting
                        ? Checkbox(
                            value: selectedNotificationIds
                                .contains(notification.id),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  selectedNotificationIds.add(notification.id);
                                } else {
                                  selectedNotificationIds
                                      .remove(notification.id);
                                }
                              });
                            },
                          )
                        : null,
                    onTap: () {
                      if (!notification.isRead) {
                        context.read<NotificationBloc>().add(
                              NotificationEvent.markAsRead(notification.id),
                            );
                      }
                    },
                  );
                },
              );
            },
            error: (errorState) => Center(child: Text(errorState.message)),
          );
        },
      ),
      floatingActionButton: isDeleting && selectedNotificationIds.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                for (var id in selectedNotificationIds) {
                  context.read<NotificationBloc>().add(
                        NotificationEvent.deleteNotification(id),
                      );
                }
                setState(() {
                  selectedNotificationIds.clear();
                  isDeleting = false;
                });
              },
              tooltip: 'Delete Selected Notifications',
              child: const Icon(Icons.delete),
            )
          : null,
    );
  }

  void _showBottomDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Delete Menu',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Select Notifications to Delete'),
                onTap: () {
                  setState(() {
                    isDeleting = true;
                  });
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.delete_forever),
                title: const Text('Delete All Notifications'),
                onTap: () {
                  context
                      .read<NotificationBloc>()
                      .add(const NotificationEvent.deleteAll());
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
