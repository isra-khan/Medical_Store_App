import 'package:flutter/material.dart';
import 'package:quickmedicalapp/utils/responsiveness.dart';

class CustomMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: const Color(0xFF5B40F5),
            ), // Custom Icon color
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: Responsive.sp(13),
                  fontWeight: FontWeight.w600,
                  color: Color(0xff091C3F).withOpacity(0.45),
                ),
              ),
            ),

            const Icon(Icons.chevron_right, size: 24, color: Colors.black45),
          ],
        ),
      ),
    );
  }
}
