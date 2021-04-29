import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materialize_jobs/controllers/intro-controller.dart';
import 'package:transparent_image/transparent_image.dart';

class SplashView extends StatelessWidget {
  final IntroController introController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        child: Center(
            child: FadeInImage(
                fadeInDuration: Duration(milliseconds: 500),
                placeholder: MemoryImage(kTransparentImage),
                image: AssetImage('assets/images/logo.png'))),
      ),
    );
  }
}
