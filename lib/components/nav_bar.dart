import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  final Function (int)? onTabChange;
  const NavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
        gap: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        color: Colors.grey[400],
        tabBackgroundColor: Colors.white,
        tabBorderRadius: 10,
        onTabChange: onTabChange,
        haptic: true,
        tabs: const [
         GButton(icon: Icons.home, text: "Home",),
         GButton(icon: Icons.shop, text: "Shop",), 
        ],
      );
  }
}