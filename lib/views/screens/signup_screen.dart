import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void _validateAndSignup() {
    if (firstNameController.text.isEmpty ||
        secondNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        rePasswordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    if (passwordController.text != rePasswordController.text) {
      Get.snackbar(
        "Error",
        "Passwords do not match",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    Get.offAllNamed('/homeScreen');
  }

  @override
  Widget build(BuildContext context) {
    const maroon = Color(0xFF800000);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: maroon,
        title: const Text("Registration"),
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
                      color: maroon.withOpacity(0.1),
                      border: Border.all(color: maroon, width: 3),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: maroon,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              _buildTextField("First Name", "enter first name", Icons.person_outline, firstNameController, maroon),
              const SizedBox(height: 30),
              _buildTextField("Second Name", "enter second name", Icons.person_outline, secondNameController, maroon),
              const SizedBox(height: 30),
              _buildTextField("Email", "enter email", Icons.email_outlined, emailController, maroon),
              const SizedBox(height: 30),
              _buildTextField("Phone number", "enter phone number", Icons.phone_outlined, phoneController, maroon),
              const SizedBox(height: 30),
              _buildTextField("Password", "enter password", Icons.lock_outline, passwordController, maroon, isPassword: true),
              const SizedBox(height: 30),
              _buildTextField("Re-enter Password", "verify the password", Icons.lock_outline, rePasswordController, maroon, isPassword: true),
              const SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: _validateAndSignup,
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: 200,
                    decoration: BoxDecoration(
                      color: maroon.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: maroon,
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
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/login');
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: maroon,
                      ),
                    ),
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

  Widget _buildTextField(String label, String hint, IconData icon, TextEditingController controller, Color maroon,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
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
              borderSide: BorderSide(
                color: maroon,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}
