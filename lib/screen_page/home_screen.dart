import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'main_screen.dart';
import './menu_screen.dart';
import './profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    MenuScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: GNav(
        backgroundColor: const Color.fromRGBO(
          121,
          85,
          72,
          1,
        ), // warna background
        activeColor: Colors.white, // warna yang sedang diselect
        color: Colors.white54, // warna icon yang tidak diselect
        tabBackgroundColor: Colors.brown.shade900,
        gap: 8, // memberikan jarak text dan icon
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        tabMargin: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 12,
          bottom: 24,
        ),
        tabs: const [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.restaurant_menu, text: 'Menu'),
          GButton(icon: Icons.person, text: 'Profile'),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (value) {
          // print(value);
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
