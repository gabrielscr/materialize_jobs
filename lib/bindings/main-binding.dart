import 'package:get/get.dart';
import 'package:materialize_jobs/controllers/storage-controller.dart';
import 'package:materialize_jobs/repositories/intro/intro-repository.dart';
import 'package:materialize_jobs/repositories/jobs/jobs-repository.dart';
import 'package:materialize_jobs/repositories/profile/profile-repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StorageController());
    Get.lazyPut(() => JobsRepository());
    Get.lazyPut(() => IntroRepository());
    Get.lazyPut(() => ProfileRepository());
  }
}
