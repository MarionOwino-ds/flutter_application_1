import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colours.dart';

class Sites extends StatelessWidget {
  const Sites({super.key});

  @override
  Widget build(BuildContext context) {
    final touristSites = [
      {"name": "Maasai Mara National Reserve", "location": "Narok County"},
      {"name": "Diani Beach", "location": "Kwale County"},
      {"name": "Mount Kenya", "location": "Central Kenya"},
      {"name": "Amboseli National Park", "location": "Kajiado County"},
      {"name": "Lamu Old Town", "location": "Lamu County"},
      {"name": "Lake Naivasha", "location": "Rift Valley"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sites"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: touristSites.length,
        itemBuilder: (context, index) {
          final site = touristSites[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListTile(
              leading: Icon(Icons.location_on, color: primaryColor),
              title: Text(site["name"]!),
              subtitle: Text(site["location"]!),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}
