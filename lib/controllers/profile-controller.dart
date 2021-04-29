import 'package:get/get.dart';
import 'package:materialize_jobs/repositories/profile/profile-repository-interface.dart';

class ProfileController extends GetxController {
  final ProfileRepositoryInterface repository;

  ProfileController({this.repository});
}
