import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/home_bloc.dart';
import 'package:shopping_bloc/ui/shared/widgets/category/category_list_widget.dart';
import 'package:shopping_bloc/ui/shared/widgets/product/product_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            Text(
              "Categorias",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            CategoryListWidget(categoriesList: bloc.categories),
            const SizedBox(height: 20),
            Text(
              "Mais Vendidos",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            ProductListWidget(products: bloc.products)
          ],
        ),
      ),
    );
  }
}
