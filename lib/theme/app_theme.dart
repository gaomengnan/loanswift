import 'package:flutter/material.dart';
import 'package:loanswift/theme/pallete.dart';

class AppTheme {
  static _border([
    Color color = Pallete.greyColor,
  ]) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static ThemeData theme = ThemeData.dark().copyWith(
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(
        Pallete.greyColor,
      ),
      focusedBorder: _border(
        Pallete.primaryColor,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Pallete.whiteColor,
    ),
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.primaryColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Pallete.blueColor,
    ),
  );
}
