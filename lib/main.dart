import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/configs/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.routes,
    );
  }
}


