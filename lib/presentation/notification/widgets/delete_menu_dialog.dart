import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_sample/presentation/notification/bloc/notification_bloc.dart';

class DeleteMenuDialog {
  static void show({
    required BuildContext context,
    required VoidCallback onStartDeleting,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _DeleteMenuContent(
        onStartDeleting: onStartDeleting,
      ),
    );
  }
}

class _DeleteMenuContent extends StatelessWidget {
  final VoidCallback onStartDeleting;

  const _DeleteMenuContent({required this.onStartDeleting});

  @override
  Widget build(BuildContext context) {
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
              onStartDeleting();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.delete_forever),
            title: const Text('Delete All Notifications'),
            onTap: () => _showDeleteAllConfirmation(context),
          ),
        ],
      ),
    );
  }

  void _showDeleteAllConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Confirm Deletion'),
        content:
            const Text('Are you sure you want to delete all notifications?'),
        actions: [
          TextButton(
            onPressed: () {
              context
                  .read<NotificationBloc>()
                  .add(const NotificationEvent.deleteAll());
              Navigator.pop(dialogContext);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('All notifications deleted')),
              );
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('No'),
          ),
        ],
      ),
    );
  }
}
