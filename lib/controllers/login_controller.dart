import 'package:get/get.dart';

class LoginController extends GetxController {

  var isLoggedIn = false.obs;
//dealing with rective variables
var books=[].obs;


var status="Not Logged in".obs;
  setIsLoggedIn(Value) {
    isLoggedIn = Value;
    status.value="Logged in";
  }
}
