import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shopping/core/constants/constant.dart';
import 'package:shopping/core/services/product_service.dart';
import 'package:shopping/data/models/product_model.dart';
import 'package:shopping/view/screens/cart_screen.dart';
import 'package:shopping/view/screens/product_screen.dart';

abstract class ProductController extends GetxController {
  Future<List<ProductModel>> getAllPruducts();
  Future<void> setProductList();
  void goToProductScreen(ProductModel product);
  void goToCartScreen();
}

class ProductControllerImp extends ProductController {
  final _productBox = Hive.box<ProductModel>(kProduct);
  late ProductServiceImp _productService;
  bool isOnLoading = true;
  List<ProductModel> productsList = [];
  ProductModel? selectedProduct;
  @override
  void onInit() async {
    _productService = Get.find();

    await setProductList();
    super.onInit();
  }

  @override
  Future<void> setProductList() async {
    try {
      productsList = await getAllPruducts();
      if (productsList.isEmpty) {
        productsList = _productBox.values.toList();
      } else {
        await _productBox.clear();
        await _productBox.addAll(productsList);
      }
    } on Exception catch (e) {
      productsList = _productBox.values.toList();
    }
    update();
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
