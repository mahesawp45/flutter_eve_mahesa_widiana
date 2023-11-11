// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eve_test/screen/home/controller/main_controller.dart';
import 'package:eve_test/screen/home/profile/profile_screen.dart';
import 'package:eve_test/widget/bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(pageController: controller.pageController),
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const [
          SizedBox(
            child: Center(child: Text("Home")),
          ),
          SizedBox(
            child: Center(child: Text("Date")),
          ),
          SizedBox(
            child: Center(child: Text("List")),
          ),
          SizedBox(
            child: Center(child: Text("Chat")),
          ),
          ProfileScreen(),
        ],
      ),
    );
  }
}
