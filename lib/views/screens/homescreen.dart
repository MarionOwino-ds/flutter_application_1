import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colours.dart';
import 'package:flutter_application_1/views/screens/dashboard.dart';
import 'package:flutter_application_1/views/screens/books.dart';
import 'package:flutter_application_1/views/screens/profiles.dart';
import 'package:flutter_application_1/views/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedScreenIndex = 0;

  // List of screens displayed by the bottom navigation bar
  final List<Widget> screens = const [
    Dashboard(),
    Books(),
    Profiles(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: screens[selectedScreenIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: primaryColor,
        buttonBackgroundColor: secondaryColor,
        height: 60,
        index: selectedScreenIndex,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.book, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            selectedScreenIndex = index;
          });
        },
      ),
    );
  }
}
