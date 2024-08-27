import 'package:flutter/material.dart';
import 'package:shopping/data/models/product_model.dart';

class FavoriteIconButton extends StatefulWidget {
  const FavoriteIconButton({
    super.key,
    required this.product,
    this.size,
    this.iconSize,
    this.backgroundColor,
    this.boxShape = BoxShape.rectangle,
    this.borderRadius,
  });

  final ProductModel product;
  final double? size, iconSize;
  final Color? backgroundColor;
  final BoxShape boxShape;
  final BorderRadiusGeometry? borderRadius;

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  Icon? icon;
  bool? isFound;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: widget.iconSize,
      padding: EdgeInsets.zero,
      icon: icon!,
      onPressed: () {},
    );
  }
}
