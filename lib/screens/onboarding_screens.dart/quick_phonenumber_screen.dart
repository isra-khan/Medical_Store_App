import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmedicalapp/utils/colorconstraint.dart';

class QuickPhoneNumberScreen extends StatelessWidget {
  const QuickPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset('assets/images/quickmedical_logo.svg'),
          Text(
            'Quick Medical',
            style: TextStyle(
              color: ColorConstraint.textColor,
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            'Please Enter your Mobile Number to Login/Sign Up',
            style: TextStyle(
              fontSize: 16,
              color: ColorConstraint.lightPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
