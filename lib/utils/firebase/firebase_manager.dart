import 'package:check_list_app/config/flavors.dart';
import 'package:check_list_app/utils/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseManager {
  static Future<void> initPlatformFirebase(Flavor flavor) async {
    try {
      DefaultFirebaseOptions firebaseOptions =
          DefaultFirebaseOptions(flavor: flavor);
      FirebaseOptions options = firebaseOptions.getFirebaseOptions();
      await Firebase.initializeApp(options: options);
      print("🍀🍀🍀 FirebaseManager >> initPlatformFirebase >> Contted 🍀🍀🍀");
    } catch (e) {
      print("💥💥💥FirebaseManager >> initPlatformFirebase >> Failed: $e💥💥💥");
    }
  }
}
