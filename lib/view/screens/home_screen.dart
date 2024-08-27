import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/home_conntroller.dart';
import 'package:shopping/view/widgets/item_card.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
      ),
      body: GetBuilder<ProductControllerImp>(builder: (controller) {
        if (controller.isOnLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 5 / 7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: controller.productsList.length,
            itemBuilder: (context, index) {
              return ItemCrad(product: controller.productsList[index]);
            },
          );
        }
      }),
    );
  }
}
