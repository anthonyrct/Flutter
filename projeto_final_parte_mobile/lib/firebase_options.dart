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
    apiKey: 'AIzaSyBbG0oVVH7Yk-tWCcdbodLUAahNWGtttlo',
    appId: '1:784172088269:web:abc96fe79012db8c232284',
    messagingSenderId: '784172088269',
    projectId: 'projeto-final-dev-senai',
    authDomain: 'projeto-final-dev-senai.firebaseapp.com',
    storageBucket: 'projeto-final-dev-senai.firebasestorage.app',
    measurementId: 'G-VX57TF98X3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKwiFM_wfjheVKtvFhQ0OxrX6rX5ZctXw',
    appId: '1:784172088269:android:8b617b242c375a63232284',
    messagingSenderId: '784172088269',
    projectId: 'projeto-final-dev-senai',
    storageBucket: 'projeto-final-dev-senai.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWIFz0pTthyybxpWh5oX-FUNF5OnZbh-U',
    appId: '1:784172088269:ios:689c385a127d930b232284',
    messagingSenderId: '784172088269',
    projectId: 'projeto-final-dev-senai',
    storageBucket: 'projeto-final-dev-senai.firebasestorage.app',
    iosBundleId: 'com.example.projetoFinalParteMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWIFz0pTthyybxpWh5oX-FUNF5OnZbh-U',
    appId: '1:784172088269:ios:689c385a127d930b232284',
    messagingSenderId: '784172088269',
    projectId: 'projeto-final-dev-senai',
    storageBucket: 'projeto-final-dev-senai.firebasestorage.app',
    iosBundleId: 'com.example.projetoFinalParteMobile',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBbG0oVVH7Yk-tWCcdbodLUAahNWGtttlo',
    appId: '1:784172088269:web:9ece28068d15780a232284',
    messagingSenderId: '784172088269',
    projectId: 'projeto-final-dev-senai',
    authDomain: 'projeto-final-dev-senai.firebaseapp.com',
    storageBucket: 'projeto-final-dev-senai.firebasestorage.app',
    measurementId: 'G-9WJJDV6G7Q',
  );
}
