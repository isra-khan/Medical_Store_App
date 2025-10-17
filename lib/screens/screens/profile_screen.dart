import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickmedicalapp/screens/splash/widgets/custom_menu_item.dart';
import 'package:quickmedicalapp/utils/colorconstraint.dart';
import 'package:quickmedicalapp/utils/responsiveness.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: Color(0xff090F47),
            fontWeight: FontWeight.bold,
            fontSize: Responsive.sp(16),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                // --- User Info Section ---
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
                  child: Row(
                    children: <Widget>[
                      // Profile Image
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorConstraint.primaryColor,
                            width: 2,
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/dr.jpg',
                            ), // Replace with your image asset or NetworkImage
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Text Info
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Hi, Isra khan',
                            style: TextStyle(
                              fontSize: Responsive.sp(24),
                              fontWeight: FontWeight.w600,
                              color: Color(0xff091C3F).withOpacity(0.45),
                            ),
                          ),
                          Text(
                            'Welcome to Quick Medical Store',
                            style: TextStyle(
                              fontSize: Responsive.sp(13),
                              fontWeight: FontWeight.w600,
                              color: Color(0xff091C3F).withOpacity(0.45),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // --- Menu Items ---
                CustomMenuItem(
                  icon: Icons.edit_note, // Closest icon for "Edit Profile"
                  title: 'Edit Profile',
                  onTap: () => debugPrint('Edit Profile tapped'),
                ),
                Divider(
                  height: 30,
                  thickness: 1,
                  color: Color(0XFF000000).withOpacity(0.1),
                ),
                CustomMenuItem(
                  icon: Icons.description_outlined,
                  title: 'My orders',
                  onTap: () => debugPrint('My orders tapped'),
                ),
                Divider(
                  height: 30,
                  thickness: 1,
                  color: Color(0XFF000000).withOpacity(0.1),
                ),
                CustomMenuItem(
                  icon: Icons.access_time, // Closest icon for 'Billing'
                  title: 'Billing',
                  onTap: () => debugPrint('Billing tapped'),
                ),
                Divider(
                  height: 30,
                  thickness: 1,
                  color: Color(0XFF000000).withOpacity(0.1),
                ),
                CustomMenuItem(
                  icon: Icons.help_outline,
                  title: 'Faq',
                  onTap: () => debugPrint('Faq tapped'),
                ),
              ],
            ),
          ),

          // --- Bottom Navigation Bar ---
        ],
      ),
    );
  }
}
