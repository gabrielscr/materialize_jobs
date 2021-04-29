import 'package:materialize_jobs/domain/profile.dart';

abstract class ProfileRepositoryInterface {
  Future<Profile> get();
}
