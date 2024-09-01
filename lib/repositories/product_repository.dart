
import 'package:dio/dio.dart';
import 'package:shopping_bloc/models/product_details_model.dart';
import 'package:shopping_bloc/models/product_item_model.dart';
import 'package:shopping_bloc/settings/settings.dart';

class ProductRepository {
  Future<List<ProductItemModel>> get getAll async {
    String url = "${Settings.apiUrl}/v1/products";
    Response response = await Dio().get(url);

    return (response.data as List)
      .map((course) => ProductItemModel.fromJson(course))
      .toList();
  }

  Future<List<ProductItemModel>> getByCategory(String category) async {
    String url = "${Settings.apiUrl}/v1/categories/$category/products";
    Response response = await Dio().get(url);
    
    return (response.data as List)
      .map((course) => ProductItemModel.fromJson(course))
      .toList();
  }

  Future<ProductDetailsModel> get(String tag) async {
    String url = "${Settings.apiUrl}/v1/products/$tag";
    Response response = await Dio().get(url);
    
    return ProductDetailsModel.fromJson(response.data);
  }
}