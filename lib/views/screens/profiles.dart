import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colours.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Profiles extends StatefulWidget {
  const Profiles({super.key});

  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  final store = GetStorage();
  Map<String, dynamic> userData = {};
  bool isLoading = true;

  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    String username = store.read("username") ?? '';
    var url = Uri.parse("http://localhost/pet_store_app/get_profile.php");
    var response = await http.post(url, body: {"phone": username});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['status'] == 'success') {
        userData = data['data'];
        fnameController.text = userData['fname'];
        lnameController.text = userData['lname'];
        emailController.text = userData['email'];
        phoneController.text = userData['phone'];
      }
    }
    setState(() => isLoading = false);
  }

  Future<void> updateProfile() async {
    var url = Uri.parse("http://localhost/pet_store_app/update_profile.php");
    var response = await http.post(
      url,
      body: {
        "id": userData['id'].toString(),
        "fname": fnameController.text,
        "lname": lnameController.text,
        "email": emailController.text,
        "phone": phoneController.text,
      },
    );
    var data = json.decode(response.body);
    Get.snackbar(
      data['status'] == 'success' ? "Success" : "Error",
      data['message'] ?? "",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: data['status'] == 'success' ? Colors.green : Colors.red,
      colorText: Colors.white,
    );
  }

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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: fnameController,
                    decoration: const InputDecoration(labelText: "First Name"),
                  ),
                  TextField(
                    controller: lnameController,
                    decoration: const InputDecoration(labelText: "Last Name"),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(labelText: "Phone"),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: updateProfile,
                    child: const Text("Update Profile"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      store.erase();
                      Get.offAllNamed('/login');
                    },
                    child: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.red),
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
