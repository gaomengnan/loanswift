import 'package:flutter/material.dart';
import 'package:loanswift/theme/pallete.dart';

const font = 'Lato'; // 字体名称

class AppTheme {
  static _border([
    Color color = Pallete.greyColor,
  ]) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static ThemeData theme = ThemeData(
    listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(
        fontFamily: font, // 设置字体
      ),
      subtitleTextStyle: TextStyle(
        fontFamily: font, // 设置字体
      ),
    ),
    primaryColor: Pallete.primaryColor,
    brightness: Brightness.light,
    fontFamily: font,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        side: BorderSide(
          width: 2,
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
    //inputDecorationTheme: InputDecorationTheme(
    //  //enabledBorder: _border(
    //  //  Pallete.blackColor,
    //  //),
    //  //focusedBorder: _border(
    //  //  Pallete.primaryColor,
    //  //),
    //),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Pallete.whiteColor,
    ),
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.whiteColor,
      elevation: 0,
    ),
    useMaterial3: true,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Pallete.blueColor,
    ),
  );
}
