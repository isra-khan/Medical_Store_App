import 'package:flutter/material.dart';

import 'package:quickmedicalapp/utils/colorconstraint.dart';
import 'package:quickmedicalapp/utils/responsiveness.dart';

class CustomProductWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double price;
  final double rating;

  const CustomProductWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xFFEAEAEA), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Container(
                decoration: BoxDecoration(
                  color: ColorConstraint.lightGrey.withOpacity(0.2),
                ),
                child: Center(
                  child: Image.asset(
                    imagePath,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: Responsive.h(1)),

              // Product Title & Subtitle
              Padding(
                padding: EdgeInsetsGeometry.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,

                        fontSize: Responsive.sp(10),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.black,

                        fontSize: Responsive.sp(10),
                      ),
                    ),
                  ],
                ),
              ), // Price
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC107),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 14,
                      color: ColorConstraint.secondaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating.toStringAsFixed(0),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
