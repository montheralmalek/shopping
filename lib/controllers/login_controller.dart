import 'package:flutter/widgets.dart';
import 'package:get/get.dart%20';
import 'package:shopping/core/services/app_service.dart';
import 'package:shopping/core/services/login_service.dart';
import 'package:shopping/data/models/login_model.dart';
import 'package:shopping/view/screens/home_screen.dart';

abstract class LoginController extends GetxController {}

class LoginControllerImp extends LoginController {
  late LoginServiceImp _loginService;
  late TextEditingController username, password;
  @override
  void onInit() {
    _loginService = Get.find();
    username = TextEditingController(text: 'mor_2314');
    password = TextEditingController(text: '83r5^_');
    super.onInit();
  }

  void login() async {
    try {
      var result = await _loginService
          .login(LoginModel(username: username.text, password: password.text));
      debugPrint('--------$result');
      if (result.isNotEmpty) {
        AppService appService = Get.find();
        await appService.sharedPreferences.setString('token', result);
        Get.toNamed(HomeScreen.id);
      }
    } on Exception catch (e) {
      debugPrint('--------$e');
    }
  }
}
