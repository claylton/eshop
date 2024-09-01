
import 'package:dio/dio.dart';
import 'package:shopping_bloc/models/category_item_model.dart';
import 'package:shopping_bloc/settings/settings.dart';

class CategoryRepository {
  Future<List<CategoryItemModel>> getAll() async {
    String url = "${Settings.apiUrl}/v1/categories";
    Response response = await Dio().get(url);

    return (response.data as List)
      .map((course) => CategoryItemModel.fromJson(course))
      .toList();
  }
}