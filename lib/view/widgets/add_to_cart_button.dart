import 'package:flutter/material.dart';
import 'package:shopping/data/models/product_model.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.product,
    this.size,
    this.iconSize,
    this.backgroundColor,
    this.boxShape = BoxShape.rectangle,
    this.borderRadius,
    this.iconColor,
    this.quantity = 1,
  });
  final int quantity;
  final ProductModel product;
  final double? size, iconSize;
  final Color? backgroundColor, iconColor;
  final BoxShape boxShape;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.add_shopping_cart_outlined),
      onPressed: () {},
    );
  }
}
