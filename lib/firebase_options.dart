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
    apiKey: 'AIzaSyC1YrTkE8tY-crV1SdYgn3bmo6uzzYcfvA',
    appId: '1:51744001023:web:d80319258c56f5ee4a35ca',
    messagingSenderId: '51744001023',
    projectId: 'e-commerce-project-4023e',
    authDomain: 'e-commerce-project-4023e.firebaseapp.com',
    storageBucket: 'e-commerce-project-4023e.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAunHmoFjDNA3NDofOm8DGlI3bV7G4T1I4',
    appId: '1:51744001023:android:6d4663f8ad9b45784a35ca',
    messagingSenderId: '51744001023',
    projectId: 'e-commerce-project-4023e',
    storageBucket: 'e-commerce-project-4023e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCRAGHiDF_z3UPKSOx2vTrG5KXq4AsDBi0',
    appId: '1:51744001023:ios:021328d9428d15064a35ca',
    messagingSenderId: '51744001023',
    projectId: 'e-commerce-project-4023e',
    storageBucket: 'e-commerce-project-4023e.firebasestorage.app',
    iosBundleId: 'com.example.eCommerceProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCRAGHiDF_z3UPKSOx2vTrG5KXq4AsDBi0',
    appId: '1:51744001023:ios:021328d9428d15064a35ca',
    messagingSenderId: '51744001023',
    projectId: 'e-commerce-project-4023e',
    storageBucket: 'e-commerce-project-4023e.firebasestorage.app',
    iosBundleId: 'com.example.eCommerceProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC1YrTkE8tY-crV1SdYgn3bmo6uzzYcfvA',
    appId: '1:51744001023:web:d9d46fedea1f563a4a35ca',
    messagingSenderId: '51744001023',
    projectId: 'e-commerce-project-4023e',
    authDomain: 'e-commerce-project-4023e.firebaseapp.com',
    storageBucket: 'e-commerce-project-4023e.firebasestorage.app',
  );
}
