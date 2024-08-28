import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/core/services/app_service.dart';
import 'package:shopping/view/screens/home_screen.dart';

class AppMiddleware extends GetMiddleware {
  AppService appService = Get.find();
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    var token = appService.sharedPreferences.getString('token');
    if (token != null && token.isNotEmpty) {
      return const RouteSettings(name: HomeScreen.id);
    }
    return super.redirect(route);
  }
}
