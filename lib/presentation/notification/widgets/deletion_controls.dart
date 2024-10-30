import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_sample/presentation/notification/bloc/notification_bloc.dart';

class DeletionControls extends StatelessWidget {
  final List<String> selectedIds;
  final ValueChanged<List<String>> onSelectionChanged;

  const DeletionControls({
    super.key,
    required this.selectedIds,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (selectedIds.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () => _deleteSelected(context),
                icon: const Icon(Icons.delete),
                label: const Text(
                  'Delete Selected',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.white,
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _deleteSelected(BuildContext context) {
    for (var id in selectedIds) {
      context.read<NotificationBloc>().add(
            NotificationEvent.deleteNotification(id),
          );
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Selected notifications deleted')),
    );

    onSelectionChanged([]);
  }
}
