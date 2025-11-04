import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colours.dart';

class Profiles extends StatelessWidget {
  const Profiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Profile Picture
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://cdn-icons-png.flaticon.com/512/3135/3135715.png", // dummy avatar
              ),
            ),

            const SizedBox(height: 10),

            // Name & Email
            const Text(
              "Marion Angela",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "marionangelaowino@gmail.com",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // Profile Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStat("Books", "12"),
                _buildStat("Followers", "250"),
                _buildStat("Following", "180"),
              ],
            ),

            const SizedBox(height: 30),

            // Info Section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.blue),
                    title: Text("Phone"),
                    subtitle: Text("+254 712 345 678"),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.red),
                    title: Text("Location"),
                    subtitle: Text("Nairobi, Kenya"),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.cake, color: Colors.purple),
                    title: Text("Birthday"),
                    subtitle: Text("January 10, 2000"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Buttons
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              label: const Text("Edit Profile"),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: const BorderSide(color: Colors.red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for statsflutter run 
  
  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

 
               