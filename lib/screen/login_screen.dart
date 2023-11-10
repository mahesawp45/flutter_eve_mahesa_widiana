// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:eve_test/resources/app_image.dart';
import 'package:eve_test/resources/app_string.dart';
import 'package:eve_test/widget/auth_button.dart';

class LoginScreen extends StatelessWidget {
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
            onTap: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppString.dontHaveAcc,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: const Text(
                  AppString.signUp,
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class AuthMainButton extends StatelessWidget {
  const AuthMainButton({
    Key? key,
    this.padding,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final EdgeInsets? padding;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: MaterialButton(
        onPressed: onTap,
        padding: const EdgeInsets.all(16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
