import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materialize_jobs/utils/routes.dart';
import 'bindings/main-binding.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: MaterializeJobsPages.pages,
    initialRoute: MaterializeJobsRoutes.splash,
    initialBinding: MainBinding(),
    title: 'Materialize Jobs',
  ));
}
