import 'package:flutter/material.dart';

class DogFoodPage extends StatelessWidget {
  const DogFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dogFoods = [
      {
        "name": "Royal Canin Puppy",
        "price": 2500,
        "image": "https://cdn.pixabay.com/photo/2016/03/27/07/08/dog-1284302_1280.jpg"
      },
      {
        "name": "Pedigree Adult",
        "price": 1800,
        "image": "https://cdn.pixabay.com/photo/2017/09/25/13/12/bowl-2786491_1280.jpg"
      },
      {
        "name": "Whiskas Dog Treats",
        "price": 900,
        "image": "https://cdn.pixabay.com/photo/2016/11/29/03/04/dog-1861831_1280.jpg"
      },
      {
        "name": "Orijen Adult Dog Food",
        "price": 3500,
        "image": "https://cdn.pixabay.com/photo/2014/04/10/11/29/dog-food-320077_1280.jpg"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dog Food Products"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: dogFoods.length,
        itemBuilder: (context, index) {
          final food = dogFoods[index];
          final name = food["name"] as String;
          final price = food["price"] as int;
          final image = food["image"] as String;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, size: 60);
                  },
                ),
              ),
              title: Text(name),
              subtitle: Text("KES $price"),
              trailing: const Icon(Icons.add_shopping_cart),
            ),
          );
        },
      ),
    );
  }
}
