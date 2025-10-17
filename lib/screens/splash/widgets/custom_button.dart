import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color textColor;
  final double borderRadius;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final bool hasBorder;
  final Color? borderColor;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.bgColor,
    required this.textColor,
    this.borderRadius = 56,
    this.height = 48,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.hasBorder = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: hasBorder
                ? BorderSide(color: borderColor ?? Colors.black, width: 1.5)
                : BorderSide.none,
          ),
          elevation: 0,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
