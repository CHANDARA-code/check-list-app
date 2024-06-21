import 'package:check_list_app/config/flavors.dart';
import 'package:check_list_app/main.dart' as runner;
import 'package:check_list_app/utils/firebase/Firebase_manager.dart';

Future<void> main() async {
  F.appFlavor = Flavor.prod;
  await runner.main();
  await FirebaseManager.initPlatformFirebase(Flavor.prod);
}
