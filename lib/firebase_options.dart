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
        return macos;
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
    apiKey: 'AIzaSyCJgivRTJi1x1GmI-lb0BVCg_iCoi-yR1s',
    appId: '1:438485287719:web:daebadd32e405a2d399f02',
    messagingSenderId: '438485287719',
    projectId: 'todo-test-app-73fad',
    authDomain: 'todo-test-app-73fad.firebaseapp.com',
    storageBucket: 'todo-test-app-73fad.appspot.com',
    measurementId: 'G-HCHZB76MSD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXIfsqAiTfhP8g28fBksZoNCvnSW7YYtg',
    appId: '1:438485287719:android:b3730dd10888fe71399f02',
    messagingSenderId: '438485287719',
    projectId: 'todo-test-app-73fad',
    storageBucket: 'todo-test-app-73fad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTJfybQxf135AnWDegGU1HyjUS3FRHE-4',
    appId: '1:438485287719:ios:1e4c7214fdcffb63399f02',
    messagingSenderId: '438485287719',
    projectId: 'todo-test-app-73fad',
    storageBucket: 'todo-test-app-73fad.appspot.com',
    iosBundleId: 'com.example.todoTestApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTJfybQxf135AnWDegGU1HyjUS3FRHE-4',
    appId: '1:438485287719:ios:81c3d1055c9b44f1399f02',
    messagingSenderId: '438485287719',
    projectId: 'todo-test-app-73fad',
    storageBucket: 'todo-test-app-73fad.appspot.com',
    iosBundleId: 'com.example.todoTestApp.RunnerTests',
  );
}