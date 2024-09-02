// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shopping_bloc/models/product_item_model.dart';
import 'package:shopping_bloc/ui/shared/widgets/product/product_card_widget.dart';
import 'package:shopping_bloc/ui/shared/widgets/shared/loader_widget.dart';

class ProductListWidget extends StatelessWidget {
  final List<ProductItemModel>? products;

  const ProductListWidget({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 410,
      child: LoaderWidget(
        object: products,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products?.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: ProductCardWidget(
            item: products![index],
          ),
        );
      },
    );
  }
}
