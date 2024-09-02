import 'package:flutter/material.dart';
import 'package:shopping_bloc/models/category_item_model.dart';
import 'package:shopping_bloc/ui/shared/widgets/category/category_card_widget.dart';
import 'package:shopping_bloc/ui/shared/widgets/shared/loader_widget.dart';

class CategoryListWidget extends StatelessWidget {
  final List<CategoryItemModel> categoriesList;

  const CategoryListWidget({super.key, required this.categoriesList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SizedBox(
        height: 90,
        child: LoaderWidget(
          object: categoriesList,
          callback: list,
        ),
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categoriesList.length,
      itemBuilder: (context, index) {
        CategoryItemModel item = categoriesList[index];

        return Padding(
          padding: const EdgeInsets.all(5),
          child: CategoryCardWidget(item: item),
        );
      },
    );
  }
}
