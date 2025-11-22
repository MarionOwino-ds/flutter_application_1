import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/configs/colours.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  void _validateAndSignup() async {
    if (firstNameController.text.isEmpty ||
        secondNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        rePasswordController.text.isEmpty) {
      Get.snackbar("Error", "All fields are required",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
      return;
    }

    if (passwordController.text != rePasswordController.text) {
      Get.snackbar("Error", "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
      return;
    }

    var url = Uri.parse('http://127.0.0.1/pet_store_app/signup.php');
    var response = await http.post(url, body: {
      'fname': firstNameController.text,
      'lname': secondNameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'password': passwordController.text,
    });

    var data = jsonDecode(response.body);

    if (data['status'] == 'success') {
      Get.snackbar("Success", "Account created successfully!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      Get.offAllNamed('/homeScreen');
    } else {
      Get.snackbar("Error", data['message'] ?? "Signup failed",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Paws & Plates Registration"),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor.withOpacity(0.1),
                      border: Border.all(color: primaryColor, width: 3),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        "https://cdn-icons-png.flaticon.com/512/620/620851.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              _buildTextField("First Name", "enter first name",
                  Icons.person_outline, firstNameController),
              const SizedBox(height: 30),
              _buildTextField("Second Name", "enter second name",
                  Icons.person_outline, secondNameController),
              const SizedBox(height: 30),
              _buildTextField(
                  "Email", "enter email", Icons.email_outlined, emailController),
              const SizedBox(height: 30),
              _buildTextField("Phone number", "enter phone number",
                  Icons.phone_outlined, phoneController),
              const SizedBox(height: 30),
              _buildTextField("Password", "enter password",
                  Icons.lock_outline, passwordController,
                  isPassword: true),
              const SizedBox(height: 30),
              _buildTextField("Re-enter Password", "verify password",
                  Icons.lock_outline, rePasswordController,
                  isPassword: true),
              const SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: _validateAndSignup,
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: 200,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ",
                      style: TextStyle(fontSize: 14, color: Colors.black87)),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/login');
                    },
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: primaryColor)),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, IconData icon,
      TextEditingController controller,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon),
            suffixIcon: isPassword ? const Icon(Icons.visibility_off) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: primaryColor, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          ),
        ),
      ],
    );
  }
}
