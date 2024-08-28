import 'package:get/get.dart';
import 'package:shopping/core/services/cart_service.dart';
import 'package:shopping/core/services/product_service.dart';

class AppService extends GetxService {
  Future<AppService> init() async {
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppService().init());
  Get.put(ProductServiceImp());
  Get.put(CartServiceImp());
}
