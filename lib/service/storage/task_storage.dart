import 'package:check_list_app/utils/base_storages/base_storage.dart';

class TaskStorage extends BaseStorage {
  @override
  String key() {
    return 'task';
  }
}
