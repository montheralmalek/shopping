import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 2)
class CategoryModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String img;
  CategoryModel({
    required this.name,
    required this.img,
  });
  factory CategoryModel.fromJson(String categoryName, String image) {
    return CategoryModel(name: categoryName, img: image);
  }
}
