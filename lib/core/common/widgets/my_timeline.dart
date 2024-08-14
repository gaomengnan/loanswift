import 'package:flutter/material.dart';
import 'package:loanswift/theme/pallete.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeline extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget endchild;
  const MyTimeline({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.endchild,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      isFirst: isFirst,
      lineXY: 0.1,
      isLast: isLast,
    
      // desorate the line
    
      beforeLineStyle: LineStyle(
        thickness: 2,
        color: isPast ? Pallete.primaryColor : Pallete.timelineNo,
      ),
    
      indicatorStyle: IndicatorStyle(
        width: 10,
        color: isPast ? Pallete.primaryColor : Pallete.timelineNo,
        iconStyle: IconStyle(
          iconData: Icons.check_circle,
          color: isPast ? Colors.white : Pallete.timelineNo,
        ),
      ),
    
      endChild: endchild,
    );
  }
}
