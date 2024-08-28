import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart%20';
import 'package:shopping/controllers/cart_controller.dart';

import '../widgets/total_price_widget.dart';

class CartScreen extends StatelessWidget {
  static const String id = '/cartScreen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${controller.cartsList.length}'),
              const Icon(Icons.shopping_cart_outlined),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TotalPriceWidget(),
            Expanded(
                child: ListView.builder(
                    itemCount: controller.cartsList.length,
                    itemBuilder: (context, index) {
                      return Text('$index');
                    }))
          ]),
        ),
      );
    });
  }
}
