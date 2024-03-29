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
    apiKey: 'AIzaSyASME-NGqYRW3Hfa6EsV51dIfX7fvge-pg',
    appId: '1:954738987178:web:4137b0d45492c1361040d3',
    messagingSenderId: '954738987178',
    projectId: 'devision-2f453',
    authDomain: 'devision-2f453.firebaseapp.com',
    storageBucket: 'devision-2f453.appspot.com',
    measurementId: 'G-CJHM6J56B6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXl6Mbhr6uItFbEeM1-NvvTYJepNyhdN8',
    appId: '1:954738987178:android:f2f3e7393525016c1040d3',
    messagingSenderId: '954738987178',
    projectId: 'devision-2f453',
    storageBucket: 'devision-2f453.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwAJm3fD1cQqVW_FeDDvhAaRYESAIe5ag',
    appId: '1:954738987178:ios:7eacd5bcd02a01491040d3',
    messagingSenderId: '954738987178',
    projectId: 'devision-2f453',
    storageBucket: 'devision-2f453.appspot.com',
    iosBundleId: 'com.example.uhealth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwAJm3fD1cQqVW_FeDDvhAaRYESAIe5ag',
    appId: '1:954738987178:ios:b54986342ed68e051040d3',
    messagingSenderId: '954738987178',
    projectId: 'devision-2f453',
    storageBucket: 'devision-2f453.appspot.com',
    iosBundleId: 'com.example.uhealth.RunnerTests',
  );
}
