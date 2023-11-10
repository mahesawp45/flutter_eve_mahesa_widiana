import 'package:flutter/material.dart';

class TextAuthButton extends StatelessWidget {
  const TextAuthButton({
    Key? key,
    required this.question,
    required this.labelButton,
    required this.onTap,
  }) : super(key: key);

  final String question;
  final String labelButton;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        MaterialButton(
          onPressed: onTap,
          child: Text(
            labelButton,
            style: const TextStyle(
              color: Colors.green,
            ),
          ),
        )
      ],
    );
  }
}
