// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eve_test/routes/app_routes.dart';
import 'package:eve_test/screen/auth/sign_screen.dart';

import 'package:eve_test/widget/button/auth_button.dart';
import 'package:eve_test/widget/button/auth_main_button.dart';
import 'package:eve_test/widget/button/text_auth_button.dart';

import 'package:flutter/material.dart';

import 'package:eve_test/resources/app_image.dart';
import 'package:eve_test/resources/app_string.dart';

import 'package:get/get.dart';

class LoginScreen extends GetView {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImage.welcome),
          const Text(
            AppString.welcome,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                AuthButton(
                  icon: AppImage.facebook,
                  label: AppString.facebook,
                  padding: const EdgeInsets.only(bottom: 14),
                  onTap: () {},
                ),
                AuthButton(
                  icon: AppImage.google,
                  label: AppString.google,
                  padding: const EdgeInsets.only(bottom: 14),
                  onTap: () {},
                ),
                AuthButton(
                  icon: AppImage.apple,
                  label: AppString.apple,
                  padding: const EdgeInsets.only(bottom: 14),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const Text(
            AppString.or,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          AuthMainButton(
            label: AppString.withPass,
            padding: const EdgeInsets.all(24),
            onTap: () {
              Get.to(
                SignScreen(
                  title: AppString.signIn,
                  authMainButtonLabel: AppString.signIn,
                  emailController: TextEditingController(),
                  passwordController: TextEditingController(),
                  onAuthMainButtonTap: () {
                    Get.toNamed(Routes.HOME);
                  },
                  onFacebookTap: () {},
                  onGoogleTap: () {},
                  onAppleTap: () {},
                  isChecked: false,
                  onChangedCheck: (value) {},
                  textAuthButton: TextAuthButton(
                    question: AppString.dontHaveAcc,
                    labelButton: AppString.signUp,
                    onTap: () {},
                  ),
                ),
              );
            },
          ),
          TextAuthButton(
            question: AppString.dontHaveAcc,
            labelButton: AppString.signUp,
            onTap: () {
              Get.to(
                SignScreen(
                  title: AppString.signUpFree,
                  authMainButtonLabel: AppString.signUp,
                  emailController: TextEditingController(),
                  passwordController: TextEditingController(),
                  onAuthMainButtonTap: () {},
                  onFacebookTap: () {},
                  onGoogleTap: () {},
                  onAppleTap: () {},
                  isChecked: false,
                  onChangedCheck: (value) {},
                  textAuthButton: TextAuthButton(
                    question: AppString.alreadyAcc,
                    labelButton: AppString.signIn,
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
