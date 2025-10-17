import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final TextEditingController controller;
  final bool obscureText;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.onSuffixTap,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.black, fontSize: 14),
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon, color: Colors.white) : null,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixTap,
                child: Icon(suffixIcon, color: Colors.white),
              )
            : null,
        hintText: hintText, // 👈 replaces labelText
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.45),
          fontSize: 17,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),

        // 🔲 Black borders
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.black, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black, width: 1.5),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}
