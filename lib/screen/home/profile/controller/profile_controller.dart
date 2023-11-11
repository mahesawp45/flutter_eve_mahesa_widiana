import 'package:eve_test/resources/app_key.dart';
import 'package:eve_test/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  late User user;
  late TextEditingController addInterestController;

  RxList<String> interest = [
    "Photography",
    "Cooking",
    "Gardening",
    "Hiking",
    "Painting",
    "Reading",
    "Yoga"
  ].obs;

  final String about =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s";

  @override
  void onInit() {
    super.onInit();
    getUser();
    addInterestController = TextEditingController(text: "");
  }

  getUser() {
    final box = GetStorage();
    user = box.read(AppKey.user);
  }

  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      final box = GetStorage();
      box.remove(AppKey.user);
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      Get.defaultDialog(title: e.toString());
    }
  }
}
