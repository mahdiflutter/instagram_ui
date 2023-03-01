import 'package:flutter/material.dart';
import 'package:instagram_ui/constants/maincolor.dart';

class FormPasswordField extends StatefulWidget {
  const FormPasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.hasError,
    required this.errorText,
  });
  final TextEditingController controller;
  final String hintText;
  final bool hasError;
  final String errorText;

  @override
  State<FormPasswordField> createState() => _FormPasswordFieldState();
}

class _FormPasswordFieldState extends State<FormPasswordField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 54.0,
      decoration: BoxDecoration(
        color: MainColors.textFieldColor,
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: Border.all(
          color: widget.hasError ? Colors.red : Colors.black,
          width: 0.7,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              obscureText: hidePassword,
              controller: widget.controller,
              autocorrect: false,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: widget.hintText,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            icon: hidePassword
                ? const Icon(
                    Icons.remove_red_eye,
                  )
                : const Icon(Icons.remove_red_eye_outlined),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
