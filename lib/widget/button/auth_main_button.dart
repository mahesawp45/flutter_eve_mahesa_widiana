import 'package:flutter/material.dart';

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
