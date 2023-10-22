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
    apiKey: 'AIzaSyAwWlGJdXVfJA2TbYGBfHBCW2J0Da1hadQ',
    appId: '1:598071176381:web:14b37a6ef9687ccaa29bd4',
    messagingSenderId: '598071176381',
    projectId: 'flutterchatapp-b438c',
    authDomain: 'flutterchatapp-b438c.firebaseapp.com',
    storageBucket: 'flutterchatapp-b438c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2v0_NJymwaT5LGDNY4WNF20maKYfX_Z4',
    appId: '1:598071176381:android:b54da02d71b77f3aa29bd4',
    messagingSenderId: '598071176381',
    projectId: 'flutterchatapp-b438c',
    storageBucket: 'flutterchatapp-b438c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAI7_68oFUtPT83DQjPjkHy1-oQSJczoLM',
    appId: '1:598071176381:ios:fd8c2db4047887f6a29bd4',
    messagingSenderId: '598071176381',
    projectId: 'flutterchatapp-b438c',
    storageBucket: 'flutterchatapp-b438c.appspot.com',
    iosBundleId: 'com.example.chatmessengerapp',
  );
}
