import 'package:get/get.dart';
import 'package:materialize_jobs/controllers/job-controller.dart';

class JobsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobController(
          repository: Get.find(),
        ));
  }
}
