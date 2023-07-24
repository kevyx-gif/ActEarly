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
    apiKey: 'AIzaSyBOTRvq0Oe5EdY3Sz2JqtiwWCapyPPxkhE',
    appId: '1:284941075546:web:0080c08795f303607bc463',
    messagingSenderId: '284941075546',
    projectId: 'actearly-db',
    authDomain: 'actearly-db.firebaseapp.com',
    storageBucket: 'actearly-db.appspot.com',
    measurementId: 'G-WZFF7WKPD9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCi_GwVKFPxTVWgPX5nDnP7TTvAEIB649E',
    appId: '1:284941075546:android:20dd7bcb22e627487bc463',
    messagingSenderId: '284941075546',
    projectId: 'actearly-db',
    storageBucket: 'actearly-db.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVpXy27s1JVc4rsaquESwvlMppu8GauN4',
    appId: '1:284941075546:ios:9d020b42a295c7747bc463',
    messagingSenderId: '284941075546',
    projectId: 'actearly-db',
    storageBucket: 'actearly-db.appspot.com',
    iosClientId: '284941075546-6h87684pci5rjo4nm7ir0qo20dtr2jvk.apps.googleusercontent.com',
    iosBundleId: 'com.example.actearly',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAVpXy27s1JVc4rsaquESwvlMppu8GauN4',
    appId: '1:284941075546:ios:715c36c87f5385a07bc463',
    messagingSenderId: '284941075546',
    projectId: 'actearly-db',
    storageBucket: 'actearly-db.appspot.com',
    iosClientId: '284941075546-gjrm4scuq1asgf70i4m4t575lr4b7rm7.apps.googleusercontent.com',
    iosBundleId: 'com.example.actearly.RunnerTests',
  );
}