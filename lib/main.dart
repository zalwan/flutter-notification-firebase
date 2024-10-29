import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notification_sample/firebase_options.dart';
import 'package:notification_sample/presentation/home/pages/home_page.dart';
import 'package:notification_sample/presentation/notification/bloc/notification_bloc.dart';
import 'package:notification_sample/presentation/notification/pages/notification_page.dart';
import 'package:notification_sample/presentation/notification/services/notification_storage_service.dart';
import 'package:notification_sample/services/firebase/firebase_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Tambahkan ini

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotificationBloc(NotificationStorageService()),
        ),
      ],
      child: MaterialApp(
        title: 'FCM Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorKey: navigatorKey,
        home: const HomePage(),
        routes: {
          NotificationPage.route: (context) => const NotificationPage(),
        },
      ),
    );
  }
}
