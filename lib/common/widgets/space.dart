import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  final double height;
  final double width;
  const Space({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
