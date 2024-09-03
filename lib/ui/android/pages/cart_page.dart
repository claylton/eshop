// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:shopping_bloc/blocs/cart_bloc.dart';
import 'package:shopping_bloc/models/cart_item_model.dart';
import 'package:shopping_bloc/ui/shared/widgets/cart/cart_item_widget.dart';
import 'package:shopping_bloc/ui/shared/widgets/shared/loader_widget.dart';

class CartPage extends StatelessWidget {
  late CartBloc bloc;
  final price = NumberFormat("#,##0.00", "pt_BR");
  List<CartItemModel> items = <CartItemModel>[];

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<CartBloc>(context);
    items = bloc.cart;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
          Expanded(
            child: LoaderWidget(
              object: bloc.cart,
              callback: list,
            ),
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "R\$ ${price.format(bloc.total)}",
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                Container(
                  color: Theme.of(context).primaryColor,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Theme.of(context).primaryColor),
                    ),
                    child: const Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(items[index].id),
          onDismissed: (direction) => bloc.remove(items[index]),
          background: Container(color: Colors.red.withOpacity(0.1)),
          child: CartItemWidget(item: items[index]),
        );
      },
    );
  }
}
