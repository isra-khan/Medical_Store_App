import 'package:flutter/material.dart';
import 'package:quickmedicalapp/utils/colorconstraint.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;
  final VoidCallback? onSearchTap;

  const CustomSearchBar({
    super.key,
    required this.controller,
    this.hintText = "Search Medicine & Healthcare products",
    required this.onChanged,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(56.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onSearchTap,
        decoration: InputDecoration(
          // Use the Search Icon on the left
          prefixIcon: Icon(Icons.search, color: ColorConstraint.lightBlack),
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorConstraint.lightBlack,
            fontSize: 14.0,
          ),
          // Remove the default border
          border: InputBorder.none,
          // Add padding inside the TextField for good spacing
          contentPadding: const EdgeInsets.symmetric(vertical: 11.0),
        ),
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }
}
