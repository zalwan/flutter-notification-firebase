// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD05B8jpMNonOIkebThkDi1-n96ODmRLYc',
    appId: '1:1829807195:web:094a3bed0bd1cc4b500b7e',
    messagingSenderId: '1829807195',
    projectId: 'notification-sample-8a570',
    authDomain: 'notification-sample-8a570.firebaseapp.com',
    storageBucket: 'notification-sample-8a570.appspot.com',
    measurementId: 'G-5CD9V2F2QH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1Zl42TWjPTGtibzDIk01U0lWFTRsQhtY',
    appId: '1:1829807195:android:d7cb0a36250ff6c4500b7e',
    messagingSenderId: '1829807195',
    projectId: 'notification-sample-8a570',
    storageBucket: 'notification-sample-8a570.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDEjGLw4rsq72lflRGkwO8WDU6Zxm7ZxA',
    appId: '1:1829807195:ios:cf2c4b08766f805d500b7e',
    messagingSenderId: '1829807195',
    projectId: 'notification-sample-8a570',
    storageBucket: 'notification-sample-8a570.appspot.com',
    iosBundleId: 'com.example.notificationSample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDEjGLw4rsq72lflRGkwO8WDU6Zxm7ZxA',
    appId: '1:1829807195:ios:cf2c4b08766f805d500b7e',
    messagingSenderId: '1829807195',
    projectId: 'notification-sample-8a570',
    storageBucket: 'notification-sample-8a570.appspot.com',
    iosBundleId: 'com.example.notificationSample',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD05B8jpMNonOIkebThkDi1-n96ODmRLYc',
    appId: '1:1829807195:web:0718cff44d5aa7b3500b7e',
    messagingSenderId: '1829807195',
    projectId: 'notification-sample-8a570',
    authDomain: 'notification-sample-8a570.firebaseapp.com',
    storageBucket: 'notification-sample-8a570.appspot.com',
    measurementId: 'G-DYHLE2RE9R',
  );
}
