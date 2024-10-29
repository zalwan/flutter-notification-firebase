import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;
import 'package:notification_sample/presentation/notification/pages/notification_page.dart';
import 'package:notification_sample/presentation/notification/bloc/notification_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Trigger initial loading of notifications
    context.read<NotificationBloc>().add(NotificationEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              int notificationCount = 0;
              state.maybeWhen(
                loaded: (notifications) {
                  notificationCount =
                      notifications.where((n) => !n.isRead).length;
                },
                orElse: () {},
              );

              return IconButton(
                icon: badges.Badge(
                  showBadge: notificationCount > 0,
                  badgeAnimation: const badges.BadgeAnimation.scale(),
                  position: badges.BadgePosition.topEnd(top: -10, end: -8),
                  badgeContent: Text(
                    notificationCount.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: const Icon(Icons.notifications),
                ),
                tooltip: 'Show notifications',
                onPressed: () {
                  Navigator.pushNamed(context, NotificationPage.route);
                },
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
