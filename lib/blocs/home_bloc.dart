// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:shopping_bloc/models/category_item_model.dart';
import 'package:shopping_bloc/models/product_item_model.dart';
import 'package:shopping_bloc/repositories/category_repository.dart';
import 'package:shopping_bloc/repositories/product_repository.dart';

class HomeBloc {
  final CategoryRepository categoryRepository = CategoryRepository();
  final ProductRepository productRepository = ProductRepository();

  late List<ProductItemModel> products;
  late List<CategoryItemModel> categories;
  String selectCategory = 'todos';

  HomeBloc(){
    getCategories;
    getProducts;
  }

  get getCategories => categoryRepository.getAll().then((data) => categories = data);
  
  get getProducts => productRepository.getAll().then((data) => products = data);

  get getProductsByCategory =>productRepository.getByCategory(selectCategory).then((data) => products = data);

  changeCategory(tag) {
    selectCategory = tag;
    products.clear();
    getProductsByCategory();
  }
}
