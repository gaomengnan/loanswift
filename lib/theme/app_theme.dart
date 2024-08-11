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

  static ThemeData theme = ThemeData(
    primaryColor: Pallete.primaryColor,
    brightness: Brightness.light,
    fontFamily: "Roboto",
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        side: BorderSide(
          width: 1,
          color: Colors.black.withOpacity(
            0.1,
          ),
        ),
        backgroundColor: Pallete.primaryColor,
      ).copyWith(
        foregroundColor: WidgetStateProperty.all<Color>(
          Pallete.primaryColor,
        ), // 设置字体颜色
      ),
    ),
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
    useMaterial3: true,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Pallete.blueColor,
    ),
  );
}
