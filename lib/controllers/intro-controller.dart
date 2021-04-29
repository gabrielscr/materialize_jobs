import 'package:get/get.dart';
import 'package:materialize_jobs/repositories/intro/intro-repository-interface.dart';

class IntroController extends GetxController {
  final IntroRepositoryInterface repository;

  IntroController({this.repository});
}
