import 'package:flutter/material.dart';

class InputCheckBox extends StatelessWidget {
  const InputCheckBox({
    Key? key,
    this.onChanged,
    required this.value,
  }) : super(key: key);

  final void Function(bool?)? onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.green,
          side: const BorderSide(
            color: Colors.green,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const Text(
          "Remember me",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
