import 'package:eve_test/resources/app_string.dart';
import 'package:eve_test/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController emailSignUpController;
  late TextEditingController passwordSignUpController;

  late TextEditingController emailSignInController;
  late TextEditingController passwordSignInController;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailSignUpController = TextEditingController(text: "");
    passwordSignUpController = TextEditingController(text: "");

    emailSignInController = TextEditingController(text: "");
    passwordSignInController = TextEditingController(text: "");
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      var user = await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offAllNamed(Routes.HOME);
      return user;
    } catch (e) {
      Get.defaultDialog(title: e.toString());
      rethrow;
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken?.token ?? "");

      var user =
          FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      // Once signed in, return the UserCredential
      Get.offAllNamed(Routes.HOME);
      return user;
    } catch (e) {
      Get.defaultDialog(title: e.toString());
      rethrow;
    }
  }

  registerWithEmail({required String email, required String password}) async {
    try {
      isLoading.value = true;

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      isLoading.value = false;
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'weak-password') {
        Get.defaultDialog(
            title: AppString.errorTitle,
            content: const Text("Your password is weak!"));
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
            title: AppString.errorTitle,
            content: const Text("Your email is already in use!"));
      }
    } catch (e) {
      Get.defaultDialog(
          title: AppString.errorTitle, content: Text(e.toString()));
    }
  }

  loginWithEmail({required String email, required String password}) async {
    try {
      isLoading.value = true;

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      isLoading.value = false;
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
            title: AppString.errorTitle,
            content: const Text("No user found for that email!"));
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
            title: AppString.errorTitle,
            content: const Text("Wrong password provided for that user!"));
      }
    } catch (e) {
      Get.defaultDialog(
          title: AppString.errorTitle, content: Text(e.toString()));
    }
  }
}
