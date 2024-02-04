import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/theme/pallete.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  // 颜色
  Color? color;

  // 内容
  String text;

  // 尺寸
  double? size;
  TextOverflow overflow;
  double? height;
  FontWeight? fontWeight;

  AppText({
    Key? key,
    required this.text,
    this.color = Pallete.blackColor,
    this.size = 12,
    this.overflow = TextOverflow.ellipsis,
    this.height = 1.2,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: text,
      decoration: BoxDecoration(
        color: Pallete.blackColor,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Text(
        text,
        maxLines: 1,
        overflow: overflow,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          // fontFamily: "Roboto"
          fontSize: size,
          height: height,
        ),
      ),
    );
  }
}
