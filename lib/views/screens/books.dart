import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colours.dart';

class Books extends StatelessWidget {
  const Books({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyBooks = [
      {"title": "The Flutter Journey", "author": "John Doe"},
      
      {"title": "UI Design Basics", "author": "Matha  otieno"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: dummyBooks.length,
        itemBuilder: (context, index) {
          final book = dummyBooks[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListTile(
              leading: Icon(Icons.book, color: primaryColor),
              title: Text(book["title"]!),
              subtitle: Text("by ${book["author"]}"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}
