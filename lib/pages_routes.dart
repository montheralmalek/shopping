import 'package:get/get.dart';
import 'package:shopping/core/middleware/app_middleware.dart';
import 'package:shopping/view/screens/cart_screen.dart';
import 'package:shopping/view/screens/home_screen.dart';
import 'package:shopping/view/screens/login_screen.dart';
import 'package:shopping/view/screens/product_screen.dart';

List<GetPage<dynamic>> pagesRoutes = [
  GetPage(name: HomeScreen.id, page: () => const HomeScreen()),
  GetPage(name: ProductScreen.id, page: () => const ProductScreen()),
  GetPage(name: CartScreen.id, page: () => const CartScreen()),
  GetPage(
      name: '/',
      page: () => const LoginScreen(),
      middlewares: [AppMiddleware()]),
];
