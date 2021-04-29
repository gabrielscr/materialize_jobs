import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  final storage = GetStorage();

  write({String key, String value}) async {
    await storage.write(key, value);
  }

  read({String key}) {
    return storage.read(key);
  }

  remove({String key}) async {
    await storage.remove(key);
  }
}
