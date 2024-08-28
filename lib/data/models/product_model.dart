class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String img;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.img,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: double.parse(jsonData['price'].toString()),
      description: jsonData['description'],
      category: jsonData['category'],
      img: jsonData['image'],
    );
  }
}
