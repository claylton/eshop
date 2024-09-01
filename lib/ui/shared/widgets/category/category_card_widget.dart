import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/home_bloc.dart';
import 'package:shopping_bloc/models/category_item_model.dart';
import 'package:shopping_bloc/settings/settings.dart';

class CategoryCardWidget extends StatelessWidget {
  final CategoryItemModel item;

  const CategoryCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: item.tag == bloc.selectCategory ? Theme.of(context).primaryColor.withOpacity(0.3) : Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(70)),
      child: TextButton(
        onPressed: () => bloc.changeCategory(item.tag),
        child: Image.asset("assets/categories/${Settings.theme}/${item.tag}.png"),
      ),
    );
  }
}
