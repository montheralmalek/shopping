import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/cart_controller.dart';
import 'package:shopping/view/widgets/checkout_form_widget.dart';
import 'package:shopping/view/widgets/horzontal_divider_titled.dart';

import '../widgets/carts_builder_widget.dart';
import '../widgets/total_price_widget.dart';

class CartScreen extends StatelessWidget {
  static const String id = '/cartScreen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(children: [
            TotalPriceWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HorzontalDivdierTitled(text: 'Order Placement'),
                      CheckoutForm(),
                    ]),
              ),
            ),
          ]),
        ),
      );
    });
  }
}
