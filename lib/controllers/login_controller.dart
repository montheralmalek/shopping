import 'package:flutter/widgets.dart';
import 'package:get/get.dart%20';
import 'package:shopping/core/services/auth_service.dart';
import 'package:shopping/data/models/login_model.dart';
import 'package:shopping/view/screens/home_screen.dart';

abstract class LoginController extends GetxController {
  void login();
  void goToHomeScreen();
}

class LoginControllerImp extends LoginController {
  late AuthServiceImp _loginService;
  late TextEditingController username, password;
  bool isOnLoading = false;
  @override
  void onInit() {
    _loginService = Get.find();
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void login() async {
    if (username.text.isNotEmpty && password.text.isNotEmpty) {
      try {
        isOnLoading = true;
        update();
        var result = await _loginService.login(
            LoginModel(username: username.text, password: password.text));
        if (result.isNotEmpty) {
          goToHomeScreen();
        }
      } catch (e) {
        Get.snackbar('Error', 'please inssure login data');
      }
      isOnLoading = false;
      update();
    }
  }

  @override
  void goToHomeScreen() {
    Get.offAllNamed(HomeScreen.id);
  }
}
