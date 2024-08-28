class CartProductModel {
  final int productId;
  final int quantity;
  CartProductModel({required this.productId, required this.quantity});

  factory CartProductModel.fromJson(jesonData) {
    return CartProductModel(
      productId: jesonData['productId'],
      quantity: jesonData['quantity'],
    );
  }
}
