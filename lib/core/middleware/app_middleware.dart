// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mas_app/core/constants/routes.dart';
// import 'package:mas_app/core/services/app_service.dart';
// import 'package:mas_app/data/sources/enums/initial_sharedpreferences.dart';

// class AppMiddleware extends GetMiddleware {
//   AppService appService = Get.find();
//   @override
//   int? get priority => 1;
//   @override
//   RouteSettings? redirect(String? route) {
//     if (appService.sharedPreferences
//             .getString(InitialSharedPreferences.onboarding.name) ==
//         InitialSharedPreferences.onboarding.data.val1) {
//       return const RouteSettings(name: RoutesConsts.initialRoute);
//     }
//     return super.redirect(route);
//   }
// }
