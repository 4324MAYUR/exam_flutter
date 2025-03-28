import 'dart:async';
import 'package:exam_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
             () {
          Get.offNamed(GetRoutes.login);
        }
    );
    return Scaffold(
      body: Center(
        child: Text("SPLASH SCREEN"),
      ),
    );
  }
}
