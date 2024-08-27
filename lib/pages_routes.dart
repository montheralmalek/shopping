import 'package:get/get.dart';
import 'package:shopping/view/screens/home_screen.dart';
import 'package:shopping/view/screens/product_screen.dart';

List<GetPage<dynamic>> pagesRoutes = [
  GetPage(name: HomeScreen.id, page: () => const HomeScreen()),
  GetPage(name: ProductScreen.id, page: () => const ProductScreen()),
];
