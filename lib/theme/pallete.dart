import 'package:flutter/material.dart';

class Pallete {
  //static const Color primaryColor = Color(0xFF00A2B2);
   static const Color primaryColor = Colors.blueAccent;
  //static const Color primaryColor = Color(0xFF006874);

  static const Color backgroundColor = Color(0xffF4F4F8);
  static const Color searchBarColor = Color.fromRGBO(32, 35, 39, 1);
  static const Color blueColor = Color.fromRGBO(29, 155, 240, 1);
  static const Color whiteColor = Color(0xffffffff);
  static const Color blackColor = Colors.black;
  static const Color greyColor = Colors.grey;
  static const Color redColor = Color.fromRGBO(249, 25, 127, 1);
  static const Color redDeepColor = Color(0xFFC72C41);
  static const Color secColor = Color(0xFFFEF7EB);
  static const Color orangeColor = Color(0xFFFEA417);

  static const Color  color3 = Colors.orange;

  static const List<Color> gradientColors = [
    Pallete.primaryColor,
    // Pallete.primaryColor,
    // Pallete.primaryColor,
    // Pallete.primaryColor,
    // Pallete.primaryColor,
    // Color(0xff4ABD8C),
    // Color(0xff4ABD8C),
    // Color(0xffA5DCC6),
    // Color(0xffA5DCC6),
    // Pallete.primaryColor,
    // Pallete.primaryColor,
    // Color(0xFF4CAF50), // 添加过渡颜色
    // Color(0xFF4CAF50), // 添加过渡颜色
    // Color(0xFF4CAF50), // 添加过渡颜色
    // Pallete.primaryColor,
    // Color(0xffF4F4F8),
    // Color(0xffF4F4F8),
    Color(0xffF4F4F8),
    // Color(0xffF4F4F8),
    // Color(0xffF4F4F8),
    // Color(0xffF4F4F8),
  ];

  static const LinearGradient loanGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    // stops: [0.0, 0.1, 0.2],
    colors: [
      Color(0xffF0FEF5),
      // Color(0xffF0FEF5),
      Pallete.whiteColor,
    ],
  );

  static const LinearGradient bottomSheetGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.1, 0.2],
    colors: [
      Color(0xffDEFDED),
      Color(0xffF4FEF9),
      Pallete.whiteColor,
      // Color(0xffF0FEF5),
      // Pallete.whiteColor,
    ],
  );
}
