import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeline extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget enchild;
  const MyTimeline({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.enchild,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,

        // desorate the line

        beforeLineStyle: LineStyle(
          thickness: 2,
          color: isPast ? Pallete.primaryColor : Pallete.timelineNo,
        ),

        indicatorStyle: IndicatorStyle(
          width: 20,
          color: isPast ? Pallete.primaryColor : Pallete.timelineNo,
          iconStyle: IconStyle(
            iconData: Icons.check_circle,
            color: isPast ? Colors.white : Pallete.timelineNo,
          ),
        ),

        endChild: enchild,
      ),
    );
  }
}
