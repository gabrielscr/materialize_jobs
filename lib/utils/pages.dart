import 'package:get/get.dart';
import 'package:materialize_jobs/bindings/home-binding.dart';
import 'package:materialize_jobs/bindings/intro-binding.dart';
import 'package:materialize_jobs/bindings/jobs-binding.dart';
import 'package:materialize_jobs/bindings/profile-binding.dart';
import 'package:materialize_jobs/views/home/home-view.dart';
import 'package:materialize_jobs/views/intro/intro-view.dart';
import 'package:materialize_jobs/views/jobs/jobs-view.dart';
import 'package:materialize_jobs/views/profile/profile-view.dart';
import 'package:materialize_jobs/views/splash/splash-view.dart';

class MaterializeJobsRoutes {
  static final String splash = '/';
  static final String home = '/home';
  static final String intro = '/intro';
  static final String jobs = '/jobs';
  static final String profile = '/profile';
}

class MaterializeJobsPages {
  static final pages = [
    GetPage(
      name: MaterializeJobsRoutes.splash,
      page: () => SplashView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: MaterializeJobsRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: MaterializeJobsRoutes.intro,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: MaterializeJobsRoutes.jobs,
      page: () => JobsView(),
      binding: JobsBinding(),
    ),
  ];
}
