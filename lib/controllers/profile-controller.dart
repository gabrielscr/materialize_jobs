import 'package:get/get.dart';
import 'package:materialize_jobs/domain/profile.dart';
import 'package:materialize_jobs/repositories/profile/profile-repository.dart';

class ProfileController extends GetxController {
  final ProfileRepository repository;

  ProfileController({this.repository});

  Rx<Profile> profile = Profile().obs;

  get() {
    profile.value = repository.get();
  }

  @override
  void onInit() {
    get();
    super.onInit();
  }
}
