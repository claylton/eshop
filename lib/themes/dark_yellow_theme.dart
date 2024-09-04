import 'package:flutter/material.dart';

const brightness = Brightness.dark;
const primaryColor = Color(0XFFFFCC00);
const lightColor = Color(0XFFFFFFFF);
const backgroundColor = Color(0XFFF5F5F5);

ThemeData darkYellowTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: primaryColor,
      secondary: Colors.black26,
      primaryContainer: Colors.white,
    ),
    textTheme: const TextTheme(
      // bodyMedium: TextStyle(color: Colors.red),
      displayMedium: TextStyle(fontSize: 78),
      labelMedium: TextStyle(color: Colors.green),
      // headlineMedium: 
    ),
  );
}
