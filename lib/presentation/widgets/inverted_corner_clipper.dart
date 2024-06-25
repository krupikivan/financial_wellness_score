import 'package:flutter/material.dart';

class InvertedCornerClipper extends CustomClipper<Path> {
  InvertedCornerClipper();

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.arcToPoint(
      const Offset(-10, 0),
      radius: const Radius.circular(10),
      clockwise: false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
