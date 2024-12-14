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
    apiKey: 'AIzaSyC7gh4E7PhA7MAHnOqxyBtUXdBNH3Ww2TI',
    appId: '1:696822262906:web:168fe9984ac936f104dfc3',
    messagingSenderId: '696822262906',
    projectId: 'loja-virtual-pro-7a57e',
    authDomain: 'loja-virtual-pro-7a57e.firebaseapp.com',
    storageBucket: 'loja-virtual-pro-7a57e.firebasestorage.app',
    measurementId: 'G-9EE3SDYJP5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNL63ZgXYinpVvY5dGzItE4b3PPcqWLM0',
    appId: '1:696822262906:android:04a5aa05a81225ee04dfc3',
    messagingSenderId: '696822262906',
    projectId: 'loja-virtual-pro-7a57e',
    storageBucket: 'loja-virtual-pro-7a57e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCyRjj12AHNCKP5xw6SCOM19wJI9fq7PFI',
    appId: '1:696822262906:ios:92a860a53045999004dfc3',
    messagingSenderId: '696822262906',
    projectId: 'loja-virtual-pro-7a57e',
    storageBucket: 'loja-virtual-pro-7a57e.firebasestorage.app',
    iosBundleId: 'br.com.jpss.lojaVirtualPro',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCyRjj12AHNCKP5xw6SCOM19wJI9fq7PFI',
    appId: '1:696822262906:ios:92a860a53045999004dfc3',
    messagingSenderId: '696822262906',
    projectId: 'loja-virtual-pro-7a57e',
    storageBucket: 'loja-virtual-pro-7a57e.firebasestorage.app',
    iosBundleId: 'br.com.jpss.lojaVirtualPro',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC7gh4E7PhA7MAHnOqxyBtUXdBNH3Ww2TI',
    appId: '1:696822262906:web:e3af30dd2d7cc30c04dfc3',
    messagingSenderId: '696822262906',
    projectId: 'loja-virtual-pro-7a57e',
    authDomain: 'loja-virtual-pro-7a57e.firebaseapp.com',
    storageBucket: 'loja-virtual-pro-7a57e.firebasestorage.app',
    measurementId: 'G-SYY786EY7K',
  );
}
