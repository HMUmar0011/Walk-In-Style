// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyB561ntVDuk2j7e9uWKsgX5AIJQoXA7yiQ',
    appId: '1:179478125780:web:e86cdeadd656b67016ef41',
    messagingSenderId: '179478125780',
    projectId: 'e-commerce-app-e4608',
    authDomain: 'e-commerce-app-e4608.firebaseapp.com',
    storageBucket: 'e-commerce-app-e4608.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9KCFvkhlW1MMviz_CKv30gNwGGpZ6_IM',
    appId: '1:179478125780:android:495764ac7705a28716ef41',
    messagingSenderId: '179478125780',
    projectId: 'e-commerce-app-e4608',
    storageBucket: 'e-commerce-app-e4608.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7fg1Y5X9qm0yMuY2c9qULTy9b1416lwo',
    appId: '1:179478125780:ios:09a6c8d890668c1d16ef41',
    messagingSenderId: '179478125780',
    projectId: 'e-commerce-app-e4608',
    storageBucket: 'e-commerce-app-e4608.appspot.com',
    iosBundleId: 'com.example.walkinstyleapp',
  );
}