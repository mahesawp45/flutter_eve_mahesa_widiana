import 'package:eve_test/routes/app_routes.dart';
import 'package:eve_test/screen/auth/login_screen.dart';
import 'package:eve_test/screen/home/binding/main_binding.dart';
import 'package:eve_test/screen/home/main_screen.dart';
import 'package:eve_test/screen/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
  ];
}
