import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomInput extends StatelessWidget {
  final String labelText;
  final Color borderColor;
  final Color labelColor;
  final Color focusedBorderColor;
  final TextInputType inputType;
  final TextEditingController controller;

  const CustomInput({
    super.key,
    required this.labelText,
    required this.borderColor,
    required this.focusedBorderColor,
    required this.inputType,
    required this.controller, required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelColor
        ),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
      keyboardType: inputType,
    );
  }
}