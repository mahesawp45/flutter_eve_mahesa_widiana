import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.padding,
  }) : super(key: key);

  final String icon;
  final String label;
  final VoidCallback onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: MaterialButton(
        onPressed: onTap,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide(
              color: Colors.grey.withOpacity(0.2),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                icon,
                height: 36,
                width: 36,
                alignment: Alignment.centerRight,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              flex: 1,
              child: Text(
                label,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
