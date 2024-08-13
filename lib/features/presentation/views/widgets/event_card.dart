import 'package:flutter/material.dart';
import 'package:loanswift/theme/pallete.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final Widget child;
  const EventCard({super.key, required this.isPast, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.only(
        top: 25,
        right: 25,
        bottom: 25,
      ),
      decoration: BoxDecoration(
        color: isPast ? Pallete.primaryColor : Pallete.timelineNo,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
