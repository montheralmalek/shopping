import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/controllers/cart_controller.dart';

class CartsBuilderWidget extends GetView<CartControllerImp> {
  const CartsBuilderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return ListView.builder(
          itemCount: controller.cartsList.length,
          itemBuilder: (context, index) {
            return Text('$index');
          });
    });
  }
}
