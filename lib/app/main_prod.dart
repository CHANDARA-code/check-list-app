import 'package:check_list_app/config/flavors.dart';
import 'package:check_list_app/main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.prod;
  await runner.main();
}
