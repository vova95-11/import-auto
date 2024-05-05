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
    apiKey: 'AIzaSyBthh_xP50PHxXvLMUlb-h40ecMoN8fv64',
    appId: '1:28889911457:web:82f7bcefd7a67db51d20e0',
    messagingSenderId: '28889911457',
    projectId: 'unit-auto',
    authDomain: 'unit-auto.firebaseapp.com',
    storageBucket: 'unit-auto.appspot.com',
    measurementId: 'G-NS79PY7PRF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3ebBAM3UD6Ym8mFM_z7Hq__IWT7H-lXI',
    appId: '1:28889911457:android:9fbe49a9d64e896f1d20e0',
    messagingSenderId: '28889911457',
    projectId: 'unit-auto',
    storageBucket: 'unit-auto.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcO7DwTQfenP4rw6CM6tcWrATD-R0abUw',
    appId: '1:28889911457:ios:7e3c333b2df4cfdc1d20e0',
    messagingSenderId: '28889911457',
    projectId: 'unit-auto',
    storageBucket: 'unit-auto.appspot.com',
    iosBundleId: 'com.example.unitAuto',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcO7DwTQfenP4rw6CM6tcWrATD-R0abUw',
    appId: '1:28889911457:ios:be86f2b677c23e701d20e0',
    messagingSenderId: '28889911457',
    projectId: 'unit-auto',
    storageBucket: 'unit-auto.appspot.com',
    iosBundleId: 'com.example.unitAuto.RunnerTests',
  );
}