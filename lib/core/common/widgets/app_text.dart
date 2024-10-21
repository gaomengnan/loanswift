import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/theme/pallete.dart';

// ignore: must_be_immutable
class RText extends StatelessWidget {
  // 颜色
  Color? color;

  // 内容
  String text;

  // 尺寸
  double? size;
  TextOverflow overflow;
  double? height;
  FontWeight? fontWeight;

  TextAlign? textAlign;

  int? maxLines;

  RText({
    super.key,
    required this.text,
    this.color = Pallete.blackColor,
    this.size = 12,
    this.overflow = TextOverflow.ellipsis,
    this.height = 1.2,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.maxLines = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: text,
      decoration: BoxDecoration(
        color: Pallete.blackColor,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: AutoSizeText(
        textScaleFactor: 1.0,
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          // fontFamily: "Lato",
          fontSize: size,
          height: height,
          //fontFamily: "Roboto",
        ),
      ),
    );
  }
}
