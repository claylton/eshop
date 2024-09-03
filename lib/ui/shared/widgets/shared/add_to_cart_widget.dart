// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/cart_bloc.dart';
import 'package:shopping_bloc/models/cart_item_model.dart';

import 'package:shopping_bloc/models/product_item_model.dart';

class AddToCartWidget extends StatelessWidget {
  final ProductItemModel item;

  const AddToCartWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    CartItemModel cartItem = CartItemModel(
      id: item.id,
      title: item.title,
      quantity: 1,
      price: item.price,
      image: item.image,
    );

    if (!bloc.itemInCart(cartItem)) {
      return GestureDetector(
        onTap: () {
          bloc.add(cartItem);
          final snackBar = SnackBar(
            content: Text('${item.title} adicionado'),
            duration: const Duration(seconds: 1),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Container(
          width: 80,
          height: 40,
          color: Theme.of(context).primaryColor,
          child: const Icon(Icons.add_shopping_cart, color: Colors.white),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          bloc.remove(cartItem);
          final snackBar = SnackBar(
            content: Text('${item.title} removido'),
            duration: const Duration(seconds: 1),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Container(
          width: 80,
          height: 40,
          color: Colors.red,
          child: const Icon(Icons.remove_shopping_cart, color: Colors.white),
        ),
      );
    }
  }
}
