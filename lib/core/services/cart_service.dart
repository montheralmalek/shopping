import 'package:dio/dio.dart';
import 'package:get/get.dart' as prefix;
import 'package:shopping/core/classes/api_request.dart';
import 'package:shopping/data/models/cart_model.dart';

abstract class CartService extends prefix.GetxService {}

class CartServiceImp extends CartService {
  final String _baseUrl = 'https://fakestoreapi.com/carts/user';
  Future<List<CartModel>> getUserCarts(int userId) async {
    try {
      ApiRequest apiRequest = ApiRequest();
      var url = '$_baseUrl/$userId';
      Response response = await apiRequest.get(httpUrl: url);
      List<CartModel> cartsList = [];
      List<dynamic> data = response.data;
      for (var element in data) {
        cartsList.add(CartModel.fromJson(element));
      }
      return cartsList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
