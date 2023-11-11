import 'package:eve_test/resources/app_key.dart';
import 'package:eve_test/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  isLoggedIn() {
    final box = GetStorage();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        box.write(AppKey.user, user);
        Get.offAllNamed(Routes.HOME);
      }
    });
  }
}
