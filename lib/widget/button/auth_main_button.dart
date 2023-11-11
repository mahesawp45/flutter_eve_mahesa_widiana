// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AuthMainButton extends StatelessWidget {
  const AuthMainButton({
    Key? key,
    this.padding,
    required this.label,
    required this.onTap,
    required this.isLoading,
  }) : super(key: key);

  final EdgeInsets? padding;
  final String label;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: MaterialButton(
        onPressed: isLoading
            ? null
            : () {
                onTap();
              },
        padding: const EdgeInsets.all(16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        color: isLoading ? Colors.green.shade400 : Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Visibility(
              visible: isLoading,
              child: const Row(
                children: [
                  SizedBox(width: 4),
                  SpinKitCircle(
                    color: Colors.white,
                    size: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
