import 'package:flutter/widgets.dart';
import 'package:shopping_bloc/models/category_item_model.dart';
import 'package:shopping_bloc/models/product_item_model.dart';
import 'package:shopping_bloc/repositories/category_repository.dart';
import 'package:shopping_bloc/repositories/product_repository.dart';

class HomeBloc extends ChangeNotifier {
  final CategoryRepository categoryRepository = CategoryRepository();
  final ProductRepository productRepository = ProductRepository();

  late List<ProductItemModel> products;
  late List<CategoryItemModel> categories;
  String selectCategory = 'todos';

  HomeBloc() {
    getCategories;
    getProducts;
  }

  get getCategories => categoryRepository.getAll.then((data) => categories = data).then((_) => notifyListeners());

  get getProducts => productRepository.getAll.then((data) => products = data).then((_) => notifyListeners());

  get getProductsByCategory => productRepository.getByCategory(selectCategory).then((data) => products = data).then((_) => notifyListeners());

  changeCategory(tag) {
    selectCategory = tag;
    products.clear();
    getProductsByCategory;
    notifyListeners();
  }
}
