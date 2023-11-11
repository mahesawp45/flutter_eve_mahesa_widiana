// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:eve_test/screen/auth/controller/login_controller.dart';
import 'package:eve_test/screen/auth/sign_screen.dart';

import 'package:eve_test/widget/button/auth_button.dart';
import 'package:eve_test/widget/button/auth_main_button.dart';
import 'package:eve_test/widget/button/text_auth_button.dart';

import 'package:flutter/material.dart';

import 'package:eve_test/resources/app_image.dart';
import 'package:eve_test/resources/app_string.dart';

import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController c = Get.put(LoginController());

    register() {
      if (c.emailSignUpController.text == "") {
        Get.snackbar(AppString.errorTitle, "Email must not empty!");
        return;
      }

      if (c.passwordSignUpController.text == "") {
        Get.snackbar(AppString.errorTitle, "Password must not empty!");
        return;
      }

      c.registerWithEmail(
          email: c.emailSignUpController.text,
          password: c.passwordSignUpController.text);
    }

    login() {
      if (c.emailSignInController.text == "") {
        Get.snackbar(AppString.errorTitle, "Email must not empty!");
        return;
      }

      if (c.passwordSignInController.text == "") {
        Get.snackbar(AppString.errorTitle, "Password must not empty!");
        return;
      }

      c.loginWithEmail(
          email: c.emailSignInController.text,
          password: c.passwordSignInController.text);
    }

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
                  onTap: () {
                    controller.signInWithFacebook();
                  },
                ),
                AuthButton(
                  icon: AppImage.google,
                  label: AppString.google,
                  padding: const EdgeInsets.only(bottom: 14),
                  onTap: () {
                    controller.signInWithGoogle();
                  },
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
            isLoading: false,
            label: AppString.withPass,
            padding: const EdgeInsets.all(24),
            onTap: () {
              Get.to(
                Obx(() {
                  return SignScreen(
                    isLoading: c.isLoading.value,
                    title: AppString.signIn,
                    authMainButtonLabel: AppString.signIn,
                    emailController: c.emailSignInController,
                    passwordController: c.passwordSignInController,
                    onAuthMainButtonTap: login,
                    onFacebookTap: () {
                      c.signInWithFacebook();
                    },
                    onGoogleTap: () {
                      c.signInWithGoogle();
                    },
                    onAppleTap: () {},
                    isChecked: false,
                    onChangedCheck: (value) {},
                    textAuthButton: TextAuthButton(
                      question: AppString.dontHaveAcc,
                      labelButton: AppString.signUp,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Obx(() {
                              return SignScreen(
                                isLoading: c.isLoading.value,
                                title: AppString.signUpFree,
                                authMainButtonLabel: AppString.signUp,
                                emailController: c.emailSignUpController,
                                passwordController: c.passwordSignUpController,
                                onAuthMainButtonTap: register,
                                onFacebookTap: () {
                                  c.signInWithFacebook();
                                },
                                onGoogleTap: () {
                                  c.signInWithGoogle();
                                },
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
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  );
                }),
              );
            },
          ),
          TextAuthButton(
            question: AppString.dontHaveAcc,
            labelButton: AppString.signUp,
            onTap: () {
              Get.to(
                Obx(() {
                  return SignScreen(
                    isLoading: c.isLoading.value,
                    title: AppString.signUpFree,
                    authMainButtonLabel: AppString.signUp,
                    emailController: c.emailSignUpController,
                    passwordController: c.passwordSignUpController,
                    onAuthMainButtonTap: register,
                    onFacebookTap: () {
                      c.signInWithFacebook();
                    },
                    onGoogleTap: () {
                      c.signInWithGoogle();
                    },
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
                  );
                }),
              );
            },
          )
        ],
      ),
    );
  }
}
