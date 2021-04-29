import 'package:get/get.dart';
import 'package:materialize_jobs/controllers/home-controller.dart';
import 'package:materialize_jobs/controllers/job-controller.dart';
import 'package:materialize_jobs/controllers/profile-controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
          jobRepository: Get.find(),
          profileRepository: Get.find(),
        ));

    Get.lazyPut(() => ProfileController(
          repository: Get.find(),
        ));

    Get.lazyPut(() => JobController(
          repository: Get.find(),
        ));
  }
}
