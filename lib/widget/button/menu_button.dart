import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.isTapped,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;
  final bool? isTapped;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 44,
      minWidth: 54,
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      color: (isTapped ?? false) ? Colors.green : Colors.green.shade50,
      onPressed: onTap,
      child: Icon(
        icon,
        color: (isTapped ?? false) ? Colors.white : Colors.green,
      ),
    );
  }
}
