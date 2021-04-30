import 'package:get/get.dart';
import 'package:materialize_jobs/domain/job-role.dart';
import 'package:materialize_jobs/domain/job.dart';
import 'package:materialize_jobs/repositories/jobs/jobs-repository.dart';

class JobController extends GetxController {
  final JobsRepository repository;

  JobController({this.repository});

  RxList<JobRole> roles = <JobRole>[].obs;

  RxList<Job> jobs = <Job>[].obs;

  RxList<Job> jobsWithRole = <Job>[].obs;

  Rx<Job> job = Job().obs;

  listRoles() {
    roles.assignAll(repository.listRoles());
  }

  list() {
    jobs.assignAll(repository.list());
  }

  listByRoleId(int roleId) {
    jobsWithRole = jobs.where((job) => job.role.id == roleId).toList().obs;
  }

  get(int id) {
    job.value = repository.list().firstWhere((job) => job.id == id);
  }

  @override
  void onInit() {
    list();
    listRoles();
    super.onInit();
  }
}
