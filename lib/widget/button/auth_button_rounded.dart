import 'package:flutter/material.dart';

class AuthButtonRounded extends StatelessWidget {
  const AuthButtonRounded({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      minWidth: 60,
      onPressed: onTap,
      padding: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
        ),
      ),
      child: Image.asset(
        icon,
        height: 24,
        width: 24,
      ),
    );
  }
}
