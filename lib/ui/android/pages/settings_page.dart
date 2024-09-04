import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_bloc/blocs/theme_bloc.dart';
import 'package:shopping_bloc/settings/settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 60),
            Text(
              "Tema atual: ${Settings.theme}",
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                save('light');
                bloc.change('light');
              },
              child: const Text("Light"),
            ),
            TextButton(
              onPressed: () {
                save('dark');
                bloc.change('dark');
              },
              child: const Text("Dark"),
            ),
            TextButton(
              onPressed: () {
                save('dark-yellow');
                bloc.change('dark-yellow');
              },
              child: const Text("Dark Yellow"),
            ),
          ],
        ));
  }

  save(String theme) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('theme', theme);
  }
}
