import 'package:flutter/material.dart';
import 'package:get/get.dart';

goToNamed(String route) {
  Future.delayed(
    Duration(milliseconds: 1),
    () => Get.toNamed(route),
  );
}

goToPage(Widget route) {
  Future.delayed(
    Duration(milliseconds: 1),
    () => Get.to(route),
  );
}
