import 'package:dio/dio.dart';
import 'package:get/get.dart ' as prefix;
import 'package:shopping/core/classes/api_request.dart';
import 'package:shopping/data/models/product_model.dart';

abstract class ProductService extends prefix.GetxService {}

class ProductServiceImp extends ProductService {
  final String _baseUrl = 'https://fakestoreapi.com/products';
  Future<List<ProductModel>> getProducts() async {
    try {
      ApiRequest apiRequest = ApiRequest();

      Response response = await apiRequest.get(httpUrl: _baseUrl);
      List<ProductModel> productsList = [];
      List<dynamic> data = response.data;
      for (var element in data) {
        productsList.add(ProductModel.fromJson(element));
      }
      return productsList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
