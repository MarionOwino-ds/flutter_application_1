import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoggedIn = false.obs;

  var status = "Not Logged in".obs;

  void setIsLoggedIn(bool value) {
    isLoggedIn.value = value;
    status.value = value ? "Logged in" : "Not Logged in";
  }
}
