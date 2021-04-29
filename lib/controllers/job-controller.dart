import 'package:get/get.dart';
import 'package:materialize_jobs/repositories/jobs/jobs-repository-interface.dart';

class JobController extends GetxController {
  final JobsRepositoryInterface repository;

  JobController({this.repository});
}
