import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final String textButton;
  final Color backgroundColor;
  final Color textColor;
  final double radius;
  final double elevation;
  final Widget? icon;
  final VoidCallback onPressed;

  const CalculateButton(
      {super.key,
      required this.textButton,
      required this.backgroundColor,
      required this.textColor,
      required this.radius,
      required this.elevation,
      this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon,
      onPressed: onPressed,
      label: Text(textButton),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: elevation,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
