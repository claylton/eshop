
import 'package:dio/dio.dart';
import 'package:shopping_bloc/models/category_model_model.dart';
import 'package:shopping_bloc/settings/settings.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getAll() async {
    String url = "${Settings.apiUrl}/v1/categories";
    Response response = await Dio().get(url);

    return (response.data as List)
      .map((course) => CategoryModel.fromJson(course))
      .toList();
  }
}