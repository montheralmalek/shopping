import 'package:get/get.dart';
import 'package:shopping/core/services/product_service.dart';
import 'package:shopping/data/models/product_model.dart';
import 'package:shopping/view/screens/cart_screen.dart';
import 'package:shopping/view/screens/product_screen.dart';

abstract class ProductController extends GetxController {
  Future<List<ProductModel>> getAllPruducts();
  void goToProductScreen(ProductModel product);
  void goToCartScreen();
}

class ProductControllerImp extends ProductController {
  late ProductServiceImp _productService;
  bool isOnLoading = true;
  List<ProductModel> productsList = [];
  ProductModel? selectedProduct;
  @override
  void onInit() async {
    _productService = Get.find();
    productsList = await getAllPruducts();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Future<List<ProductModel>> getAllPruducts() async {
    isOnLoading = true;
    var result = await _productService.getProducts();
    isOnLoading = false;
    update();
    return result;
  }

  @override
  void goToProductScreen(ProductModel product) {
    selectedProduct = product;
    Get.toNamed(ProductScreen.id);
  }

  @override
  void goToCartScreen() {
    Get.toNamed(CartScreen.id);
  }
}
