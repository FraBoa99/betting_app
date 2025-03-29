// File generated by FlutterFire CLI.
// ignore_for_file: type=lint

// 📦 Package imports:
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAGirMQ6tHnPh4qfzLwRYRxeYtpqP8yuKo',
    appId: '1:261259473995:web:bfd2755eefd0d4ae36c9ce',
    messagingSenderId: '261259473995',
    projectId: 'betting-app-bd063',
    authDomain: 'betting-app-bd063.firebaseapp.com',
    storageBucket: 'betting-app-bd063.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBInKREAuataP8Og5Gq2bdfagoykYh1oOg',
    appId: '1:261259473995:android:8804510657e1697d36c9ce',
    messagingSenderId: '261259473995',
    projectId: 'betting-app-bd063',
    storageBucket: 'betting-app-bd063.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqXZhcyGoFb8LXJXGrpm5D7terHCSTHUI',
    appId: '1:261259473995:ios:e141024871260ef536c9ce',
    messagingSenderId: '261259473995',
    projectId: 'betting-app-bd063',
    storageBucket: 'betting-app-bd063.firebasestorage.app',
    iosBundleId: 'com.example.bettingApp',
  );

}
