// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shopping_bloc/models/product_details_model.dart';

import 'package:shopping_bloc/repositories/product_repository.dart';
import 'package:shopping_bloc/ui/shared/widgets/shared/progress_indicator_widget.dart';

class ProductPage extends StatelessWidget {
  final String tag;
  final ProductRepository _repository = ProductRepository();

  ProductPage({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductDetailsModel>(
      future: _repository.getProductDetails(tag),
      builder: (context, snapshot) {
        ProductDetailsModel? product = snapshot.data;
        print("-> ${snapshot.data}");
        print("-> ${snapshot.error}");

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text("Aguardando");
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const Center(
              child: ProgressIndicatorWidget(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return content(product);
            }
          default:
            Center(
              child: Text(snapshot.error.toString()),
            );
        }
        return Center(
          child: Text(snapshot.error.toString()),
        );
      },
    );
  }

  Widget content(ProductDetailsModel? product) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product?.images.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 200,
            child: Image.network(product!.images[index]),
          );
        },
      ),
    );
  }
}
