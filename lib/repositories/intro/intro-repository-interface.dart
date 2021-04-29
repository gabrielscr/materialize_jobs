import 'package:materialize_jobs/domain/intro.dart';

abstract class IntroRepositoryInterface {
  Future<List<Intro>> list();
}
