import 'dart:async';
import 'package:exam_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 6),
      () => Get.offAllNamed(GetRoutes.login),
    );
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.black],
                begin: Alignment.center,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Opacity(
            opacity: 0.2,
            child: Image.asset(
              'assets/login_image/background.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              // logo Image
              Image.asset(
                'assets/login_image/logo.png',
                height: 150,
              ),
              const SizedBox(height: 30),
              // Welcome Text
              const Text(
                "Welcome to My Auth App",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              // Animation
              Lottie.asset(
                'assets/login_image/Animation.json',
                height: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
