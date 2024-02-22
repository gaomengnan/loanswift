import 'package:flutter/material.dart';

class AppClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(size.width, 0.0) // Move to the top-right corner
      ..lineTo(size.width, size.height)
      ..lineTo(20.0, size.height) // Create a small notch
      ..lineTo(0.0, size.height - 20.0)
      ..lineTo(0.0, 0.0); // Close the path to the top-left corner
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
