// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eve_test/widget/button/auth_button_rounded.dart';
import 'package:eve_test/widget/button/auth_main_button.dart';
import 'package:eve_test/widget/input/input_check_box.dart';
import 'package:eve_test/widget/input/input_text.dart';
import 'package:flutter/material.dart';

import 'package:eve_test/resources/app_image.dart';
import 'package:eve_test/resources/app_string.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({
    Key? key,
    required this.title,
    required this.textAuthButton,
    required this.emailController,
    required this.passwordController,
    required this.isChecked,
    this.onChangedCheck,
    required this.authMainButtonLabel,
    required this.onAuthMainButtonTap,
    required this.onFacebookTap,
    required this.onGoogleTap,
    required this.onAppleTap,
  }) : super(key: key);

  final String title;
  final Widget textAuthButton;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isChecked;
  final void Function(bool?)? onChangedCheck;
  final String authMainButtonLabel;
  final VoidCallback onAuthMainButtonTap;
  final VoidCallback onFacebookTap;
  final VoidCallback onGoogleTap;
  final VoidCallback onAppleTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImage.logo,
                height: 200,
                fit: BoxFit.cover,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    InputText(
                      controller: emailController,
                      label: AppString.email,
                      hintText: AppString.email,
                      isMandatory: true,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [
                        AutofillHints.email,
                      ],
                    ),
                    const SizedBox(height: 24),
                    InputText(
                      controller: passwordController,
                      label: AppString.password,
                      hintText: AppString.password,
                      isObsecure: true,
                      isMandatory: true,
                    ),
                    const SizedBox(height: 24),
                    InputCheckBox(
                      value: isChecked,
                      onChanged: onChangedCheck,
                    ),
                    AuthMainButton(
                      label: authMainButtonLabel,
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      onTap: onAuthMainButtonTap,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 24),
                        const Text(AppString.orContinue),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AuthButtonRounded(
                              icon: AppImage.facebook,
                              onTap: onFacebookTap,
                            ),
                            AuthButtonRounded(
                              icon: AppImage.google,
                              onTap: onGoogleTap,
                            ),
                            AuthButtonRounded(
                              icon: AppImage.apple,
                              onTap: onAppleTap,
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        textAuthButton
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
