import 'package:shopping/data/models/cart_product_model.dart';

class CartModel {
  final int id;
  final int userId;
  final String date;
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
