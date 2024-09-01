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
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
    
      // desorate the line
    
      beforeLineStyle: const LineStyle(
        thickness: 2,
        color: Pallete.primaryColor,
      ),
    
      indicatorStyle: IndicatorStyle(
        width: 20,
        color: isPast ? Pallete.primaryColor : Pallete.secondaryColor,
        iconStyle: IconStyle(
          iconData: Icons.check_circle,
          color: isPast ? Colors.white : Pallete.timelineNo,
        ),
      ),
    
      endChild: enchild,
    );
  }
}
