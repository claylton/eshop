import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_bloc/settings/settings.dart';
import 'package:shopping_bloc/themes/dark_theme.dart';
import 'package:shopping_bloc/themes/dark_yellow_theme.dart';
import 'package:shopping_bloc/themes/light_theme.dart';

class ThemeBloc extends ChangeNotifier {
  var theme = lightTheme();

  ThemeBloc() {
    load();
  }

  change(String color) {
    switch (color) {
      case 'light':
        {
          theme = lightTheme();
          Settings.theme = 'light';
          notifyListeners();
          break;
        }
      case 'dark':
        {
          theme = darkTheme();
          Settings.theme = 'dark';
          notifyListeners();
          break;
        }
      case 'dark-yellow':
        {
          theme = darkYellowTheme();
          Settings.theme = 'dark-yellow';
          notifyListeners();
          break;
        }
      default:
        {
          theme = lightTheme();
          Settings.theme = 'light';
          notifyListeners();
          break;
        }
    }
  }

  Future load() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? theme = preferences.getString('theme');
    Settings.theme = theme!.isEmpty ? 'light' : theme;
    change(Settings.theme);
  }
}
