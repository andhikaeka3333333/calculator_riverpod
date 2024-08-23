import 'package:flutter/material.dart';

class ItemDashboard extends StatelessWidget {
  final IconData? iconData;
  final String? image;
  final String title;
  final double iconSize;
  final Color? iconColor;
  final VoidCallback onTap;
  final double containerHeight;
  final double containerRadius;
  final Color containerColor;
  final MainAxisAlignment mainAxisAlignment;
  final double marginRight;
  final double marginTop;
  final double fontSize;
  final FontWeight fontWeight;

  const ItemDashboard({
    super.key,
    this.iconData,
    this.image,
    required this.title,
    required this.iconSize,
    this.iconColor,
    required this.containerHeight,
    required this.containerRadius,
    required this.containerColor,
    required this.mainAxisAlignment,
    required this.marginRight,
    required this.fontSize,
    required this.fontWeight,
    required this.onTap, required this.marginTop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: containerHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(containerRadius),
            color: containerColor,
          ),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              if (iconData != null) ...[
                Icon(
                  iconData,
                  size: iconSize,
                  color: iconColor,
                ),
              ] else if (image != null) ...[
                Image.asset(
                  image!,
                  width: iconSize, // Menggunakan iconSize sebagai ukuran gambar
                  height: iconSize,
                ),
              ],
              SizedBox(
                width: marginRight,
              ),
              Text(
                title,
                style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
