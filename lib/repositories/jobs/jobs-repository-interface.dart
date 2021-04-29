import 'package:materialize_jobs/domain/job-role.dart';
import 'package:materialize_jobs/domain/job.dart';

abstract class JobsRepositoryInterface {
  Future<List<Job>> listAll();

  Future<List<Job>> listByRoleId(int roleId);

  Future<List<JobRole>> listRoles();

  Future<Job> get(int id);

  Future<List<Job>> search(String title);
}
