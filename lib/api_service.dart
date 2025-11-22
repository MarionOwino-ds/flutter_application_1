import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://127.0.0.1/pet_store_app/signup.php';
  static Future<Map<String, dynamic>> signup({
    required String fname,
    required String lname,
    required String email,
    required String phone,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup.php'),
      body: {
        'fname': fname,
        'lname': lname,
        'email': email,
        'phone': phone,
        'password': password,
      },
    );

    return json.decode(response.body);
  }

  static Future<Map<String, dynamic>> login({
    required String phone,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login.php'),
      body: {
        'phone': phone,
        'password': password,
      },
    );

    return json.decode(response.body);
  }
}
