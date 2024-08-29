import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/core/constants/constant.dart';
import 'package:shopping/core/services/cart_service.dart';
import 'package:shopping/core/services/auth_service.dart';
import 'package:shopping/core/services/product_service.dart';
import 'package:shopping/data/models/cart_model.dart';
import 'package:shopping/data/models/cart_product_model.dart';
import 'package:shopping/data/models/category_model.dart';
import 'package:shopping/data/models/product_model.dart';

class AppService extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<AppService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CartProductModelAdapter());
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<CartProductModel>(kCartProduct);
  await Hive.openBox<CartModel>(kCart);
  await Hive.openBox<CategoryModel>(kCategory);
  await Hive.openBox<ProductModel>(kProduct);

  await Get.putAsync(() => AppService().init());
  Get.put(ProductServiceImp());
  Get.put(CartServiceImp());
  Get.put(AuthServiceImp());
}
