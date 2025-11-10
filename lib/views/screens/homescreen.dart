import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colours.dart';
import 'package:flutter_application_1/views/screens/dashboard.dart';
import 'package:flutter_application_1/views/screens/sites.dart';
import 'package:flutter_application_1/views/screens/profiles.dart';
import 'package:flutter_application_1/views/screens/settings.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedScreenIndex = 0;

  final List<Widget> screens = const [
    Dashboard(),
    Sites(),
    Profiles(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Tembea Kenya"),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: screens[selectedScreenIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedScreenIndex,
        height: 60,
        color: primaryColor,
        buttonBackgroundColor: secondaryColor,
        backgroundColor: Colors.white,
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
