import 'package:get/get.dart';
import 'package:shopping/core/services/cart_service.dart';
import 'package:shopping/data/models/cart_model.dart';

abstract class CartController extends GetxController {
  Future<List<CartModel>> getCarts();
  double getTotalPrice();
  void goToCartScreen();
}

class CartControllerImp extends CartController {
  late CartServiceImp _cartService;
  bool isOnLoading = true;
  List<CartModel> cartsList = [];
  double _totalPrice = 0.0;

  @override
  void onInit() async {
    _cartService = Get.find();
    cartsList = await getCarts();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Future<List<CartModel>> getCarts() async {
    isOnLoading = true;
    var result = await _cartService.getUserCarts(1);
    isOnLoading = false;
    update();
    return result;
  }

  @override
  void goToCartScreen() {}

  @override
  double getTotalPrice() {
    return _totalPrice;
  }
}
