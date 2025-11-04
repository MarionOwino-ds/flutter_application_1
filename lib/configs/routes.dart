import 'package:get/get.dart';
import 'package:flutter_application_1/views/screens/login_screen.dart';
import 'package:flutter_application_1/views/screens/signup_screen.dart';
import 'package:flutter_application_1/views/screens/homescreen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/homeScreen';

  static List<GetPage> routes = [
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: signup, page: () => const SignupScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
  ];
}
