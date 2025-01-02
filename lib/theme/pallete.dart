import 'package:flutter/material.dart';

class Pallete {
  static const networkCheckColor = Color(0xffF5E5E6);
  //static const Color primaryColor = Color(0xFF00A2B2);
  //static const Color primaryColor = Colors.blueAccent;
  //static const Color primaryColor = Colors.purple;
  static const Color primaryColor = Color(0xFF4F53CD);
//#B1C1F0
  static Color secondaryColor = const Color(0xFFB1C1F0);
  static Color thirdColor = const Color(0xffA7ACE6);

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

  static Color color3 = const Color(0xff8FBC8F);

  static Color color4 = Pallete.primaryColor.withOpacity(0.3);

  static final timelineNo = const Color(0xFF4F53CD).withOpacity(0.5);

  static const List<Color> gradientColors = [
    Pallete.primaryColor,
    Color(0xffF4F4F8),
  ];

  static const LinearGradient quotaGradien = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    //stops: [0.5, 0.6, 1],
    colors: [
      Color(0xffDEE5F7),
      Color(0xffDFE6F5),
      Color(0xffE7EDF9),
      Color(0xffF5F5FE),
      Pallete.whiteColor
    ],
  );

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
    ],
  );
}
