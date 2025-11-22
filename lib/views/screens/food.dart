import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class DogFoodPage extends StatefulWidget {
  const DogFoodPage({super.key});

  @override
  State<DogFoodPage> createState() => _DogFoodPageState();
}

class _DogFoodPageState extends State<DogFoodPage> {
  List<dynamic> dogFoods = [];

  @override
  void initState() {
    super.initState();
    fetchDogFoods();
  }

  fetchDogFoods() async {
    var url = Uri.parse('http://localhost/pet_store_app/dog_food.php');
    var response = await http.get(url);
    setState(() {
      dogFoods = json.decode(response.body);
    });
  }

  deleteDogFood(String id) async {
    var url = Uri.parse('http://localhost/pet_store_app/delete_dog_food.php');
    await http.post(url, body: {'id': id});
    fetchDogFoods();
  }

  addOrUpdateDogFood({String? id, String? name, String? price, String? image}) async {
    TextEditingController nameController = TextEditingController(text: name);
    TextEditingController priceController = TextEditingController(text: price);
    TextEditingController imageController = TextEditingController(text: image);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(id == null ? "Add Dog Food" : "Edit Dog Food"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameController, decoration: const InputDecoration(hintText: "Name")),
            TextField(controller: priceController, decoration: const InputDecoration(hintText: "Price")),
            TextField(controller: imageController, decoration: const InputDecoration(hintText: "Image URL")),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () async {
                var url = Uri.parse(id == null
                    ? 'http://localhost/pet_store_app/add_dog_food.php'
                    : 'http://localhost/pet_store_app/update_dog_food.php');
                await http.post(url, body: {
                  if (id != null) 'id': id,
                  'name': nameController.text,
                  'price': priceController.text,
                  'image': imageController.text
                });
                Navigator.pop(context);
                fetchDogFoods();
              },
              child: const Text("Save")),
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dog Food Products"),
        actions: [IconButton(onPressed: () => addOrUpdateDogFood(), icon: const Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: dogFoods.length,
        itemBuilder: (context, index) {
          var food = dogFoods[index];
          return ListTile(
            leading: Image.network(food['image'], width: 60, height: 60, fit: BoxFit.cover),
            title: Text(food['name']),
            subtitle: Text("KES ${food['price']}"),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton(onPressed: () => addOrUpdateDogFood(id: food['id'], name: food['name'], price: food['price'].toString(), image: food['image']), icon: const Icon(Icons.edit)),
              IconButton(onPressed: () => deleteDogFood(food['id'].toString()), icon: const Icon(Icons.delete)),
            ]),
          );
        },
      ),
    );
  }
}
