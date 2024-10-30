import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_sample/presentation/notification/bloc/notification_bloc.dart';
import 'package:notification_sample/presentation/notification/widgets/delete_menu_dialog.dart';
import 'package:notification_sample/presentation/notification/widgets/deletion_controls.dart';
import 'package:notification_sample/presentation/notification/widgets/notification_list.dart';

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
  void initState() {
    super.initState();
    _loadNotifications();
  }

  void _loadNotifications() {
    context
        .read<NotificationBloc>()
        .add(const NotificationEvent.getNotifications());
  }

  void _toggleDeletionMode(bool value) {
    setState(() {
      isDeleting = value;
      if (!value) selectedNotificationIds.clear();
    });
  }

  void _toggleNotificationSelection(String id, bool? selected) {
    setState(() {
      if (selected == true) {
        selectedNotificationIds.add(id);
      } else {
        selectedNotificationIds.remove(id);
      }

      if (selectedNotificationIds.isEmpty) {
        _toggleDeletionMode(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => DeleteMenuDialog.show(
              context: context,
              onStartDeleting: () => _toggleDeletionMode(true),
            ),
          ),
        ],
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          return state.map(
            initial: (_) =>
                const Center(child: Text('Welcome to Notifications')),
            loading: (_) => const Center(child: CircularProgressIndicator()),
            loaded: (loadedState) => Column(
              children: [
                Expanded(
                  child: NotificationList(
                    notifications: loadedState.notifications,
                    isDeleting: isDeleting,
                    selectedIds: selectedNotificationIds,
                    onToggleSelection: _toggleNotificationSelection,
                  ),
                ),
                if (isDeleting)
                  DeletionControls(
                    selectedIds: selectedNotificationIds,
                    onSelectionChanged: (newSelection) {
                      setState(() {
                        selectedNotificationIds = newSelection;

                        if (selectedNotificationIds.isEmpty) {
                          _toggleDeletionMode(false);
                        }
                      });
                    },
                  ),
              ],
            ),
            error: (errorState) => Center(child: Text(errorState.message)),
          );
        },
      ),
    );
  }
}
