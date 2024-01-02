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
    apiKey: 'AIzaSyBz4-EvkMtL_iDf3xf-UOIGgPC6H9h8p2g',
    appId: '1:146581251076:web:4a0f55dd71ce925fc08151',
    messagingSenderId: '146581251076',
    projectId: 'final-test-af',
    authDomain: 'final-test-af.firebaseapp.com',
    storageBucket: 'final-test-af.appspot.com',
    measurementId: 'G-NN1B50WCJT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC09HjmLuTKPrZdl62QVWCJtofw59jLegc',
    appId: '1:146581251076:android:48c165582e15c78bc08151',
    messagingSenderId: '146581251076',
    projectId: 'final-test-af',
    storageBucket: 'final-test-af.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFjFa_QYY9gbYciPCbXs_d7hNI_HMl0WE',
    appId: '1:146581251076:ios:4c25e6fac424deabc08151',
    messagingSenderId: '146581251076',
    projectId: 'final-test-af',
    storageBucket: 'final-test-af.appspot.com',
    iosBundleId: 'com.example.contactAppFinalTestAf',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFjFa_QYY9gbYciPCbXs_d7hNI_HMl0WE',
    appId: '1:146581251076:ios:34e2bd821e60d4e2c08151',
    messagingSenderId: '146581251076',
    projectId: 'final-test-af',
    storageBucket: 'final-test-af.appspot.com',
    iosBundleId: 'com.example.contactAppFinalTestAf.RunnerTests',
  );
}