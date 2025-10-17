import 'package:flutter/material.dart';
import 'package:quickmedicalapp/screens/screens/home_screen.dart';
import 'package:quickmedicalapp/screens/screens/profile_screen.dart';
import 'package:quickmedicalapp/utils/responsiveness.dart';

class CustomNavBarScreen extends StatefulWidget {
  const CustomNavBarScreen({super.key});

  @override
  State<CustomNavBarScreen> createState() => _CustomNavBarScreenState();
}

class _CustomNavBarScreenState extends State<CustomNavBarScreen> {
  int _selectedIndex = 4;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Container(),
    Container(),
    Container(),
    ProfileScreen(),
  ];

  static const Color primaryBlue = Color(
    0xFF5B4EF0,
  ); // PAB background & active color
  static const Color inactiveGrey = Color(0xFF8A8A91); // Inactive icons
  static const Color selectedInactive = Color(0xFFC0B7FF);
  static const Color badgeRed = Color(0xFFFF453A); // Notification badge

  void _onItemTapped(int index) {
    if (index == 2) {
      // Example: Open a modal when the PAB is tapped
      showModalBottomSheet(
        context: context,
        builder: (context) => const Padding(
          padding: EdgeInsets.all(32.0),
          child: Text(
            'Primary Action Button Pressed!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    bool hasBadge = false,
  }) {
    Color iconColor;

    if (index == 4 && _selectedIndex == 4) {
      iconColor = selectedInactive;
    } else if (index == _selectedIndex) {
      iconColor = primaryBlue;
    } else {
      iconColor = inactiveGrey;
    }

    if (index == 0 && _selectedIndex != 0) {
      iconColor = inactiveGrey;
    }

    return Expanded(
      child: InkWell(
        onTap: () => _onItemTapped(index),
        child: Container(
          height: 60,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(icon, size: 28, color: iconColor),
              if (hasBadge)
                Positioned(
                  top: 10,
                  right: 15,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: badgeRed,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Scaffold(
      // Display the screen based on the selected index
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: primaryBlue,
          borderRadius: BorderRadius.circular(15), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: primaryBlue.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IconButton(
          icon: const Icon(
            Icons.add_box_outlined, // Using a similar icon for "Add"
            size: 20,
            color: Colors.white,
          ),
          onPressed: () =>
              _onItemTapped(2), // Call _onItemTapped for PAB action
        ),
      ),

      // 3. The Bottom Navigation Bar (BottomAppBar)
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 5,
        // notchShape is key to create space for the PAB
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // 1. Home (Index 0)
            _buildNavItem(index: 0, icon: Icons.home_outlined),

            // 2. Notifications (Index 1)
            _buildNavItem(
              index: 1,
              icon: Icons.notifications_none,
              hasBadge: true,
            ),

            // 3. Spacer for PAB (Index 2 is the PAB)
            const SizedBox(width: 40),

            // 4. Shopping Bag (Index 3)
            _buildNavItem(index: 3, icon: Icons.shopping_bag_outlined),

            // 5. Profile (Index 4)
            _buildNavItem(index: 4, icon: Icons.person_outline),
          ],
        ),
      ),
    );
  }
}
