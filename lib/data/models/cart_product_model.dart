import 'package:hive/hive.dart';

part 'cart_product_model.g.dart';

@HiveType(typeId: 1)
class CartProductModel extends HiveObject {
  @HiveField(0)
  final int productId;
  @HiveField(1)
  final int quantity;
  CartProductModel({required this.productId, required this.quantity});

  factory CartProductModel.fromJson(jesonData) {
    return CartProductModel(
      productId: jesonData['productId'],
      quantity: jesonData['quantity'],
    );
  }
}
