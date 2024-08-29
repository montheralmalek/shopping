import 'package:get/get.dart ';
import 'package:shopping/core/classes/api_request.dart';
import 'package:shopping/core/services/app_service.dart';
import 'package:shopping/data/models/login_model.dart';

abstract class AuthService extends GetxService {
  Future<String> login(LoginModel loginModel);
  String? getToken();
}

class AuthServiceImp extends AuthService {
  final AppService _appService = Get.find();

  @override
  Future<String> login(LoginModel loginModel) async {
    const String baseUrl = 'https://fakestoreapi.com/auth/login';
    try {
      var body = loginModel.toJson();

      var response = await ApiRequest().post(url: baseUrl, data: body);
      var token = response.data['token'];
      _setToken(token);
      return token;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _setToken(String token) async {
    await _appService.sharedPreferences.setString('token', token);
  }

  @override
  String? getToken() {
    final token = _appService.sharedPreferences.getString('token');
    return token;
  }

  bool get isLogedIn {
    final token = _appService.sharedPreferences.getString('token');
    return token != null;
  }
}
