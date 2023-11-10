import 'package:eve_test/resources/app_image.dart';
import 'package:eve_test/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(const LoginScreen());
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImage.logo),
            const SizedBox(height: 20),
            const SpinKitCircle(
              color: Colors.greenAccent,
              size: 70,
            )
          ],
        ),
      ),
    );
  }
}
