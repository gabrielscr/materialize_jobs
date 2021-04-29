import 'package:get/get.dart';
import 'package:materialize_jobs/controllers/storage-controller.dart';
import 'package:materialize_jobs/domain/intro.dart';
import 'package:materialize_jobs/repositories/intro/intro-repository.dart';
import 'package:materialize_jobs/utils/pages.dart';
import 'package:materialize_jobs/utils/routes.dart';

class IntroController extends GetxController {
  final IntroRepository repository;
  final StorageController storageController;

  IntroController({this.storageController, this.repository});

  RxList<Intro> intros = <Intro>[].obs;

  RxInt indexSelected = 0.obs;

  RxInt maxIndex = 0.obs;

  handle() {
    Future.delayed(Duration(seconds: 3), () {
      if (storageController.read(key: 'introViewed') == null)
        goToNamed(MaterializeJobsRoutes.intro);
      else
        goToNamed(MaterializeJobsRoutes.home);
    });
  }

  list() {
    intros.assignAll(repository.list());

    maxIndex.value = intros.length - 1;
  }

  finish() {
    storageController.write(key: 'introViewed', value: 'yes');

    goToNamed(MaterializeJobsRoutes.home);
  }

  @override
  void onInit() {
    list();
    handle();
    super.onInit();
  }
}
