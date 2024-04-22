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
    apiKey: 'AIzaSyAMGYLmThmVouSKFsBfgKnhC6PIw4CqF8w',
    appId: '1:904337431761:web:5cd64a7cfd1c10ed40b9f0',
    messagingSenderId: '904337431761',
    projectId: 'pbt-sec',
    authDomain: 'pbt-sec.firebaseapp.com',
    storageBucket: 'pbt-sec.appspot.com',
    measurementId: 'G-7PLG6BRQ6R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsTkI_PDG2-hS_Uww4PyNHnL9SU_HeiqA',
    appId: '1:904337431761:android:1c18acf334c5ff4940b9f0',
    messagingSenderId: '904337431761',
    projectId: 'pbt-sec',
    storageBucket: 'pbt-sec.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBiFfLwzstdgwH8hjooyic71IPx1-XPWM',
    appId: '1:904337431761:ios:610bd9276aa1aa3e40b9f0',
    messagingSenderId: '904337431761',
    projectId: 'pbt-sec',
    storageBucket: 'pbt-sec.appspot.com',
    iosBundleId: 'com.example.battery',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCBiFfLwzstdgwH8hjooyic71IPx1-XPWM',
    appId: '1:904337431761:ios:610bd9276aa1aa3e40b9f0',
    messagingSenderId: '904337431761',
    projectId: 'pbt-sec',
    storageBucket: 'pbt-sec.appspot.com',
    iosBundleId: 'com.example.battery',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAMGYLmThmVouSKFsBfgKnhC6PIw4CqF8w',
    appId: '1:904337431761:web:f33ac5c8bd8f12ec40b9f0',
    messagingSenderId: '904337431761',
    projectId: 'pbt-sec',
    authDomain: 'pbt-sec.firebaseapp.com',
    storageBucket: 'pbt-sec.appspot.com',
    measurementId: 'G-GCLBHNRG4T',
  );
}