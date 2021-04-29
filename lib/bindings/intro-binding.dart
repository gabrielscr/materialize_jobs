import 'package:get/get.dart';
import 'package:materialize_jobs/controllers/intro-controller.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroController(
          repository: Get.find(),
          storageController: Get.find(),
        ));
  }
}
