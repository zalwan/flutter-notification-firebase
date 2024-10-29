import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_sample/presentation/notification/bloc/notification_bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const route = '/notification-page';

  @override
  Widget build(BuildContext context) {
    // Memanggil event getNotifications saat halaman dibuka
    context
        .read<NotificationBloc>()
        .add(const NotificationEvent.getNotifications());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete All Notifications',
            onPressed: () {
              // Memanggil event untuk menghapus semua notifikasi
              context
                  .read<NotificationBloc>()
                  .add(const NotificationEvent.deleteAll());
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
                    title: Text(notification.title),
                    subtitle: Text(notification.body),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Memanggil event untuk menghapus notifikasi tertentu
                        context.read<NotificationBloc>().add(
                            NotificationEvent.deleteNotification(
                                notification.id));
                      },
                    ),
                    onTap: () {
                      // Memanggil event untuk menandai notifikasi sebagai dibaca
                      if (!notification.isRead) {
                        context
                            .read<NotificationBloc>()
                            .add(NotificationEvent.markAsRead(notification.id));
                      }
                      // Lakukan aksi lain jika diperlukan
                    },
                  );
                },
              );
            },
            error: (errorState) => Center(child: Text(errorState.message)),
          );
        },
      ),
    );
  }
}
