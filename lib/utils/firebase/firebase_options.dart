import 'package:check_list_app/config/flavors.dart';
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  final Flavor flavor;
  DefaultFirebaseOptions({required this.flavor});

  FirebaseOptions getFirebaseOptions() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return _androidFlavor();
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for iOS - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macOS - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for Windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for Linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  FirebaseOptions _androidFlavor() {
    switch (flavor) {
      case Flavor.dev:
      case Flavor.staging:
        return androidDev;
      case Flavor.prod:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this flavor.',
        );
    }
  }

  static const FirebaseOptions androidDev = FirebaseOptions(
    apiKey: 'AIzaSyDsIRvEu8h8BqC9mstuO-f8M6Gctmn-HRs',
    appId: '1:35696084070:android:32a63715d38c7c7c4759a7',
    messagingSenderId: '35696084070',
    projectId: 'check-list-app-dev',
    storageBucket: 'check-list-app-dev.appspot.com',
  );
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDScCL1eQh64e_Xs_lL2cBtVWD1aGGjRA4',
    appId: '1:130720269859:android:e8e2357fc3dde2842bd396',
    messagingSenderId: '130720269859',
    projectId: 'check-list-app-b9ba1',
    storageBucket: 'check-list-app-b9ba1.appspot.com',
  );
}
