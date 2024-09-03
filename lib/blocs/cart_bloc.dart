
import 'package:flutter/material.dart';
import 'package:shopping_bloc/models/cart_item_model.dart';

class CartBloc extends ChangeNotifier {
  List<CartItemModel> cart = [];
  double total = 0.0;

  get() {
    return cart;
  }

  add(CartItemModel item) {
    cart.add(item);
    calculateTotal();
  }

  remove(CartItemModel item) {
    cart.removeWhere((element) => element.id == item.id);
  }

  bool itemInCart(CartItemModel item) {
    bool result = false;
    for (var element in cart) {
      if (element.id == item.id) result = true;
    }
    return result;
  }

  increase(CartItemModel item) {
    if (item.quantity < 10) {
      item.quantity++;
      calculateTotal();
    }
  }

  decrease(CartItemModel item) {
    if (item.quantity > 1) {
      item.quantity--;
      calculateTotal();
    }
  }

  calculateTotal() {
    total = 0.0;
    for (var element in cart) {
      total += element.price * element.quantity;
    }
    notifyListeners();
  }
}