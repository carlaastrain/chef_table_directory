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
    apiKey: 'AIzaSyBgpMl3w1V-1_S81FRq7zc9Pglv7-jf7bM',
    appId: '1:4748212936:web:7063e7cdda1c3a538743fd',
    messagingSenderId: '4748212936',
    projectId: 'chef-table-app',
    authDomain: 'chef-table-app.firebaseapp.com',
    storageBucket: 'chef-table-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtMaZHmNkhC2EIftkL12NkXqA9NwJ2Sx4',
    appId: '1:4748212936:android:2e919566c88d32338743fd',
    messagingSenderId: '4748212936',
    projectId: 'chef-table-app',
    storageBucket: 'chef-table-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAyGNj2WHE90_gISO8wG9d9slMQukvWdw',
    appId: '1:4748212936:ios:a5d39f8a6e0577e98743fd',
    messagingSenderId: '4748212936',
    projectId: 'chef-table-app',
    storageBucket: 'chef-table-app.appspot.com',
    iosClientId: '4748212936-bpoojeumqc27183p6mbrqpguffvupdn8.apps.googleusercontent.com',
    iosBundleId: 'com.example.myChefApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBAyGNj2WHE90_gISO8wG9d9slMQukvWdw',
    appId: '1:4748212936:ios:3b5f1f745501b2c78743fd',
    messagingSenderId: '4748212936',
    projectId: 'chef-table-app',
    storageBucket: 'chef-table-app.appspot.com',
    iosClientId: '4748212936-fcehlkh114q53p2b615vus3049bm25n2.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );
}
