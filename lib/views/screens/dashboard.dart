import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colours.dart';
import 'package:get_storage/get_storage.dart';

var store = GetStorage();

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final username = store.read("username") ?? "Explorer";

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              "Welcome, $username 👋",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Discover beautiful destinations across Kenya",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView(
                children: [
                  _buildCard(
                    "Popular Destinations",
                    "Explore top-rated tourist attractions",
                    Icons.landscape,
                    secondaryColor,
                  ),
                  _buildCard(
                    "Local Guides",
                    "Find trusted tour guides near you",
                    Icons.group,
                    primaryColor,
                  ),
                  _buildCard(
                    "Travel Tips",
                    "Get useful travel advice and updates",
                    Icons.tips_and_updates,
                    Colors.orange,
                  ),
                  _buildCard(
                    "Your Saved Places",
                    "View sites you’ve saved for later",
                    Icons.favorite,
                    Colors.redAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
