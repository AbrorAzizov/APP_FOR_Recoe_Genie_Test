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
    apiKey: 'AIzaSyCClBP2xSLrqCQ7Tkl6Vum9vIdZsTX8neg',
    appId: '1:991605031503:web:06a581a710190705b5203a',
    messagingSenderId: '991605031503',
    projectId: 'qolber-clean-arc',
    authDomain: 'qolber-clean-arc.firebaseapp.com',
    storageBucket: 'qolber-clean-arc.firebasestorage.app',
    measurementId: 'G-NC7NL7L43C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBC37X2oiYo4KxUO7qzpNNDsfrLYfyF2TM',
    appId: '1:991605031503:android:351681d2023a1edeb5203a',
    messagingSenderId: '991605031503',
    projectId: 'qolber-clean-arc',
    storageBucket: 'qolber-clean-arc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCY9USRJ4mR_49zXW1mw2ecgd64WAV1Su4',
    appId: '1:991605031503:ios:28096f6642dd9500b5203a',
    messagingSenderId: '991605031503',
    projectId: 'qolber-clean-arc',
    storageBucket: 'qolber-clean-arc.firebasestorage.app',
    iosBundleId: 'com.example.qolberCleanArc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCY9USRJ4mR_49zXW1mw2ecgd64WAV1Su4',
    appId: '1:991605031503:ios:28096f6642dd9500b5203a',
    messagingSenderId: '991605031503',
    projectId: 'qolber-clean-arc',
    storageBucket: 'qolber-clean-arc.firebasestorage.app',
    iosBundleId: 'com.example.qolberCleanArc',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCClBP2xSLrqCQ7Tkl6Vum9vIdZsTX8neg',
    appId: '1:991605031503:web:929656aab3b63a13b5203a',
    messagingSenderId: '991605031503',
    projectId: 'qolber-clean-arc',
    authDomain: 'qolber-clean-arc.firebaseapp.com',
    storageBucket: 'qolber-clean-arc.firebasestorage.app',
    measurementId: 'G-PQ0T0G79LE',
  );
}
