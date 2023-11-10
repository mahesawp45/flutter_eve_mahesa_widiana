// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  const InputText({
    Key? key,
    required this.label,
    this.isMandatory,
    required this.hintText,
    this.autofillHints,
    this.keyboardType,
    this.isObsecure,
    required this.controller,
  }) : super(key: key);

  final String label;
  final bool? isMandatory;
  final String hintText;
  final List<String>? autofillHints;
  final TextInputType? keyboardType;
  final bool? isObsecure;
  final TextEditingController controller;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                widget.label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Visibility(
                visible: widget.isMandatory == true,
                child: const Text(
                  "*",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.only(
            top: 4,
            right: 8,
            bottom: 4,
            left: 24,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey.withOpacity(0.2),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(60),
            ),
          ),
          child: TextField(
            controller: widget.controller,
            cursorColor: Colors.green,
            autofillHints: widget.autofillHints,
            keyboardType: widget.keyboardType,
            obscureText: (widget.isObsecure ?? false) && !isVisible,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.3),
                ),
                suffixIcon: Visibility(
                  visible: widget.isObsecure == true,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                      isVisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
