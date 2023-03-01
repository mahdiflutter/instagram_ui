import 'package:flutter/material.dart';
import 'package:instagram_ui/constants/maincolor.dart';

class formTextField extends StatefulWidget {
  const formTextField({
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
  State<formTextField> createState() => _formTextFieldState();
}

class _formTextFieldState extends State<formTextField> {
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
          color: widget.hasError?Colors.red:Colors.black,
          width: 0.7,
        ),
      ),
      child: Row(
        children:  [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: widget.controller,
              autocorrect: false,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText:widget.hintText,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
