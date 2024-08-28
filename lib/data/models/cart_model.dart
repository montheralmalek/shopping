import 'package:hive/hive.dart';
import 'package:shopping/data/models/cart_product_model.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final List<CartProductModel> products;
  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });
  factory CartModel.fromJson(jsonData) {
    List<CartProductModel> cartProducts = [];
    jsonData['products'].map((cartProduct) =>
        cartProducts.add(CartProductModel.fromJson(cartProduct)));

    return CartModel(
      id: jsonData['id'],
      userId: jsonData['userId'],
      date: jsonData['date'],
      products: cartProducts,
    );
  }
}
