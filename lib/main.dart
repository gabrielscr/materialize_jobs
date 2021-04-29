import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:materialize_jobs/utils/pages.dart';
import 'bindings/main-binding.dart';

main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: MaterializeJobsPages.pages,
    initialRoute: MaterializeJobsRoutes.splash,
    initialBinding: MainBinding(),
    title: 'Materialize Jobs',
  ));
}
