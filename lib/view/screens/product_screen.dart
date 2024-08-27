import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopping/controllers/home_conntroller.dart';
import 'package:shopping/view/widgets/products_listview_builder.dart';

class ProductScreen extends GetView<ProductControllerImp> {
  static const String id = '/product';
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = controller.selectedProduct!;
    Get.put(ProductControllerImp());
    return GetBuilder<ProductControllerImp>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Shopping App'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Image(
              image: NetworkImage(product.img),
              height: 300,
              //fit: BoxFit.,
            ),
            const Gap(10),
            ListTile(
              title: const Text('Title'),
              subtitle: Text(product.title),
            ),
            ListTile(
              title: const Text('Category'),
              subtitle: Text(product.category),
            ),
            ListTile(
              title: const Text('Description'),
              subtitle: Text(product.description),
            )
          ]),
        ),
      );
    });
  }
}
