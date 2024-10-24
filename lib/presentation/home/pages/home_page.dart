import 'package:flutter/material.dart';
import 'package:notification_sample/presentation/notification/pages/notification_page.dart';
import 'package:notification_sample/presentation/notification/services/notification_service.dart';
import 'package:notification_sample/presentation/notification/widgets/notification_icon.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NotificationServices _notificationServices;
  int _unreadNotificationCount = 0;
  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();
    _notificationServices = NotificationServices(
      onNotificationTap: _handleNotificationTap,
    );
    _initNotifications();
    _updateUnreadNotificationCount();

    // Listen to FCM messages when app is in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (!_isUpdating) {
        _isUpdating = true;
        await Future.delayed(const Duration(milliseconds: 500));
        await _updateUnreadNotificationCount();
        _isUpdating = false;
      }
    });
  }

  void _handleNotificationTap(String? payload) {
    // Handle notification tap here
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotificationPage(),
      ),
    ).then((_) => _updateUnreadNotificationCount());
  }

  Future<void> _initNotifications() async {
    await _notificationServices.init();
  }

  Future<void> _updateUnreadNotificationCount() async {
    final count = await _notificationServices.getUnreadNotificationCount();
    if (mounted) {
      setState(() {
        _unreadNotificationCount = count;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          NotificationIcon(
            count: _unreadNotificationCount,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              ).then((_) => _updateUnreadNotificationCount());
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}
