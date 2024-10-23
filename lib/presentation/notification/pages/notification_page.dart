import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Digunakan untuk format tanggal
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
  final Set<String> _selectedNotifications = {};
  bool _isSelectMode = false; // Menandakan apakah dalam mode pemilihan

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
  }

  Future<void> _loadNotifications() async {
    final notifications = await _notificationServices.getNotifications();
    setState(() {
      _notifications = notifications;
    });
  }

  void _showModalOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.delete_forever),
                title: const Text('Delete All Notifications'),
                onTap: () {
                  Navigator.pop(context);
                  _showDeleteAllConfirmation(); // Tampilkan dialog konfirmasi
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Select Notifications to Delete'),
                onTap: () {
                  Navigator.pop(context);
                  _toggleSelectMode(); // Panggil metode untuk masuk ke mode pemilihan
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteAllConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content:
              const Text('Are you sure you want to delete all notifications?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                await _notificationServices.deleteAllNotifications();
                setState(() {
                  _notifications.clear();
                });
                Navigator.of(context).pop(); // Tutup dialog setelah menghapus
              },
            ),
          ],
        );
      },
    );
  }

  void _toggleSelectMode() {
    setState(() {
      _isSelectMode = !_isSelectMode; // Ubah status mode pemilihan
    });
  }

  void _deleteSelectedNotifications() async {
    for (String id in _selectedNotifications) {
      await _notificationServices.deleteNotification(id);
    }
    setState(() {
      _notifications.removeWhere(
          (notification) => _selectedNotifications.contains(notification.id));
      _selectedNotifications.clear();
      _isSelectMode = false; // Keluar dari mode pemilihan setelah menghapus
    });
  }

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('yyyy-MM-dd HH:mm')
        .format(timestamp); // Format tanggal dan waktu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert), // Tombol dot menu
            onPressed: () => _showModalOptions(context),
          ),
        ],
      ),
      body: _notifications.isEmpty
          ? const Center(child: Text('No notifications available.'))
          : ListView.builder(
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];

                return Column(
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              notification.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8), // Jarak kecil antara teks
                          Row(children: [
                            const Icon(
                              Icons.circle,
                              color: Colors.grey,
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _formatTimestamp(notification.timestamp),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ])
                        ],
                      ),
                      subtitle: Text(notification.body),
                      tileColor: notification.isRead ? null : Colors.grey[200],
                      onTap: _isSelectMode
                          ? () {
                              setState(() {
                                if (_selectedNotifications
                                    .contains(notification.id)) {
                                  _selectedNotifications
                                      .remove(notification.id);
                                } else {
                                  _selectedNotifications.add(notification.id);
                                }
                              });
                            }
                          : () {
                              // Mark notification as read if not in select mode
                              _notificationServices
                                  .markNotificationAsRead(notification.id);
                              setState(() {
                                final updatedNotification =
                                    notification.copyWith(isRead: true);
                                _notifications[index] = updatedNotification;
                              });
                            },
                      trailing: _isSelectMode
                          ? Checkbox(
                              value: _selectedNotifications
                                  .contains(notification.id),
                              onChanged: (bool? selected) {
                                setState(() {
                                  if (selected == true) {
                                    _selectedNotifications.add(notification.id);
                                  } else {
                                    _selectedNotifications
                                        .remove(notification.id);
                                  }
                                });
                              },
                            )
                          : null,
                    ),
                    const Divider(height: 1), // Garis pemisah antar notifikasi
                  ],
                );
              },
            ),
      floatingActionButton: _isSelectMode && _selectedNotifications.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: _deleteSelectedNotifications,
              label: const Text('Delete Selected'),
              icon: const Icon(Icons.delete),
              backgroundColor: Colors.red, // Warna merah untuk tombol
            )
          : null, // Menghilangkan FAB jika tidak dalam mode pemilihan
    );
  }
}
