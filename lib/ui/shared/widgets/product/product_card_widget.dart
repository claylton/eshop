// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shopping_bloc/models/product_item_model.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductItemModel item;

  const ProductCardWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final price = NumberFormat('#,##0.00', 'pt_BR');

    return Container(
      margin: const EdgeInsets.all(5),
      width: 240,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.03),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                image: DecorationImage(image: NetworkImage(item.image))),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            height: 60,
            child: Text(
              item.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Text(
              item.brand,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    "R\$ ${price.format(item.price)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
