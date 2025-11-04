import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colours.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Welcome Back 👋",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Here’s an overview of your activity:",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildCard(Icons.book, "My Books", "12", primaryColor),
                  _buildCard(Icons.favorite, "Favorites", "5", Colors.pink),
                  _buildCard(Icons.person, "Followers", "200", Colors.teal),
                  _buildCard(Icons.star, "Rating", "4.5", Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, String count, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Text(
            count,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
