import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopping/controllers/home_conntroller.dart';
import 'package:shopping/view/widgets/products_listview_builder.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductControllerImp());
    return GetBuilder<ProductControllerImp>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Shopping App'),
        ),
        body: ModalProgressHUD(
          inAsyncCall: controller.isOnLoading,
          child: ProductsListViewBuilder(
            productsList: controller.productsList,
          ),
        ),
      );
    });
  }
}
