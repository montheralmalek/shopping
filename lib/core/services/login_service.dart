import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart ' as prefix;
import 'package:shopping/core/classes/api_request.dart';
import 'package:shopping/data/models/login_model.dart';

abstract class LoginService extends prefix.GetxService {}

class LoginServiceImp extends LoginService {
  final String _baseUrl = 'https://fakestoreapi.com/auth/login';
  Future<String> login(LoginModel loginModel) async {
    try {
      Map<String, dynamic> body = loginModel.toJson();
      //
      FormData formData = FormData.fromMap(body);

      var response = await ApiRequest().post(url: _baseUrl, data: formData);

      return response.data['token'];
    } catch (e) {
      throw Exception(e);
    }
  }
}
