import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.android:
        return android;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
          'DefaultFirebaseOptions have not been configured for $defaultTargetPlatform - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }
  }

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiP6jzuGyiJeJJF1MHAxc6Ou5yFkXyeD4',
    appId: '1:563584335869:ios:YOUR_IOS_APP_ID',
    messagingSenderId: '563584335869',
    projectId: 'bloodhope-61452',
    storageBucket: 'bloodhope-61452.appspot.com',
    iosClientId: 'YOUR_IOS_CLIENT_ID',
    iosBundleId: 'com.example.bloodDonationApp',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCiP6jzuGyiJeJJF1MHAxc6Ou5yFkXyeD4',
    appId: '1:563584335869:android:YOUR_ANDROID_APP_ID',
    messagingSenderId: '563584335869',
    projectId: 'bloodhope-61452',
    storageBucket: 'bloodhope-61452.appspot.com',
  );
}
