import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/cart_bloc.dart';
import 'package:shopping_bloc/blocs/home_bloc.dart';
import 'package:shopping_bloc/blocs/theme_bloc.dart';
import 'package:shopping_bloc/blocs/user_bloc.dart';
import 'package:shopping_bloc/ui/android/pages/tabs_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(value: HomeBloc()),
        ChangeNotifierProvider<CartBloc>.value(value: CartBloc()),
        ChangeNotifierProvider<UserBloc>.value(value: UserBloc()),
        ChangeNotifierProvider<ThemeBloc>.value(value: ThemeBloc()),
      ],
      child: const Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);

    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: bloc.theme,
      home: const DefaultTabController(
        length: 3,
        child: TabsPage(),
      ),
    );
  }
}
