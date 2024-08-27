import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/home_conntroller.dart';
import 'package:shopping/data/models/product_model.dart';
import 'package:shopping/view/widgets/item_card.dart';

class ProductsListViewBuilder extends StatelessWidget {
  const ProductsListViewBuilder({
    super.key,
    required this.productsList,
  });
  final List<ProductModel> productsList;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductControllerImp>(builder: (controller) {
      return GridView.builder(
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
    });
  }
}
