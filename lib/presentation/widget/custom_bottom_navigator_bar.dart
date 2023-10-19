import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const CustomBottomNavigationBar(
      {super.key, required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.8, vertical: 10),
        child: GNav(
          selectedIndex: selectedIndex,
          onTabChange: onTabChange,
          gap: 8,
          activeColor: NBSecondPrimaryColor,
          color: NBPrimaryColor,
          tabBackgroundColor: NBSecondPrimaryColor.withOpacity(0.1),
          padding: const EdgeInsets.all(12),
          iconSize: 28,
          tabs: const [
            GButton(
              icon: Icons.home,
            ),
            GButton(
              icon: Icons.local_hospital,
            ),
            GButton(
              icon: Icons.business_center,
            ),
            GButton(
              icon: Icons.article_outlined,
            ),
            GButton(
              icon: Icons.chat_bubble,
            ),
          ],
        ),
      ),
    );
  }
}
