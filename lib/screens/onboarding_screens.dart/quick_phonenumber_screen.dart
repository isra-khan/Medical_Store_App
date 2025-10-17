import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmedicalapp/routes/routes.dart';
import 'package:quickmedicalapp/screens/splash/widgets/custom_button.dart';
import 'package:quickmedicalapp/screens/splash/widgets/custom_textfield.dart';
import 'package:quickmedicalapp/utils/colorconstraint.dart';

class QuickPhoneNumberScreen extends StatelessWidget {
  final TextEditingController _nameControler = TextEditingController();

  QuickPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstraint.secondaryColor,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/qiuckmedical_logo.svg',
              width: 100,
              height: 100,
            ),

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
            SizedBox(height: 20),
            CustomTextField(
              controller: _nameControler,
              hintText: '+9 2362658490',
            ),
            SizedBox(height: 40),
            CustomButton(
              borderRadius: 56,
              title: 'Continue',
              onPressed: () {
                Navigator.pushNamed(context, Routes.product_details);
              },
              bgColor: ColorConstraint.primaryColor,
              textColor: ColorConstraint.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
