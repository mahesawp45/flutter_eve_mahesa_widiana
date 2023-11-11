import 'package:eve_test/widget/button/menu_button.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MenuButton(
            icon: Icons.home,
            isTapped: index == 0,
            onTap: () {
              index = 0;
              widget.pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.easeInOut);
              setState(() {});
            },
          ),
          MenuButton(
            icon: Icons.date_range,
            isTapped: index == 1,
            onTap: () {
              index = 1;
              widget.pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.easeInOut);
              setState(() {});
            },
          ),
          MenuButton(
            icon: Icons.list,
            isTapped: index == 2,
            onTap: () {
              index = 2;
              widget.pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.easeInOut);
              setState(() {});
            },
          ),
          MenuButton(
            icon: Icons.chat,
            isTapped: index == 3,
            onTap: () {
              index = 3;
              widget.pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.easeInOut);
              setState(() {});
            },
          ),
          MenuButton(
            icon: Icons.person,
            isTapped: index == 4,
            onTap: () {
              index = 4;
              widget.pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.easeInOut);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
