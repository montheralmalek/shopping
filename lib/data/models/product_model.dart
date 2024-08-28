import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 3)
class ProductModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String category;
  @HiveField(5)
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
