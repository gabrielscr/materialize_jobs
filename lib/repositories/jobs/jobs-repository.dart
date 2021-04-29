import 'package:materialize_jobs/domain/job-role.dart';
import 'package:materialize_jobs/domain/job.dart';
import 'package:materialize_jobs/repositories/jobs/jobs-repository-interface.dart';

class JobsRepository implements JobsRepositoryInterface {
  @override
  Future<Job> get(int id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<Job>> listAll() {
    // TODO: implement listAll
    throw UnimplementedError();
  }

  @override
  Future<List<Job>> listByRoleId(int roleId) {
    // TODO: implement listByRoleId
    throw UnimplementedError();
  }

  @override
  Future<List<JobRole>> listRoles() {
    // TODO: implement listRoles
    throw UnimplementedError();
  }

  @override
  Future<List<Job>> search(String title) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
