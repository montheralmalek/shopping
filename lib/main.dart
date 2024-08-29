import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shopping/core/constants/app_them.dart';
import 'package:shopping/core/services/app_service.dart';
import 'package:shopping/pages_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      getPages: pagesRoutes,
      theme: AppThem.themeData,
    );
  }
}
