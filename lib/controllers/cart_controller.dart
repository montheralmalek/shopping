import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shopping/core/constants/constant.dart';
import 'package:shopping/core/services/app_service.dart';
import 'package:shopping/core/services/auth_service.dart';
import 'package:shopping/core/services/cart_service.dart';
import 'package:shopping/data/models/cart_model.dart';
import 'package:shopping/data/models/product_model.dart';
import 'package:shopping/view/screens/login_screen.dart';

abstract class CartController extends GetxController {
  Future<List<CartModel>> getCarts();
  Future<void> setCartList();
  double getTotalPrice();
  void goToCartScreen();
  void addToCart(ProductModel product);
}

class CartControllerImp extends CartController {
  final _cartBox = Hive.box<CartModel>(kCart);
  late CartServiceImp _cartService;
  bool isOnLoading = true;
  List<CartModel> cartsList = [];
  double _totalPrice = 0.0;
  late AuthServiceImp _authService;

  @override
  void onInit() async {
    _cartService = Get.find();
    _authService = Get.find();
    await setCartList();
    super.onInit();
  }

  @override
  Future<void> setCartList() async {
    try {
      cartsList = await getCarts();
      if (cartsList.isEmpty) {
        cartsList = _cartBox.values.toList();
      } else {
        await _cartBox.clear();
        await _cartBox.addAll(cartsList);
      }
    } catch (e) {
      cartsList = _cartBox.values.toList();
    }
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

  @override
  void addToCart(ProductModel product) {
    if (_authService.isLogedIn) {
    } else {
      Get.toNamed(LoginScreen.id);
    }
  }
}
