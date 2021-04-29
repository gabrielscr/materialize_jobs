import 'package:get/get.dart';
import 'package:materialize_jobs/repositories/jobs/jobs-repository.dart';
import 'package:materialize_jobs/repositories/profile/profile-repository.dart';

class HomeController extends GetxController {
  final JobsRepository jobRepository;
  final ProfileRepository profileRepository;

  HomeController({this.profileRepository, this.jobRepository});
}
