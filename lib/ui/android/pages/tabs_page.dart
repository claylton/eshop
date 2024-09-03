import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/cart_bloc.dart';
import 'package:shopping_bloc/ui/android/pages/account_page.dart';
import 'package:shopping_bloc/ui/android/pages/cart_page.dart';
import 'package:shopping_bloc/ui/android/pages/home_page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
  final CartBloc bloc = Provider.of<CartBloc>(context);

    return Scaffold(
      body: TabBarView(
        children: [
          const HomePage(),
          CartPage(),
          const AccountPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          const Tab(icon: Icon(Icons.home)),
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_cart),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: Text(
                      bloc.cart.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
          const Tab(icon: Icon(Icons.perm_identity))
        ],
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: const EdgeInsets.all(5),
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
