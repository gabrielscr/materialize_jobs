import 'package:get/get.dart';
import 'package:materialize_jobs/controllers/profile-controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(
          repository: Get.find(),
        ));
  }
}
