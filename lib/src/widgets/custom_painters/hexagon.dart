import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => getDistortedHexagonPath(size);

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

class HexagonFramePainter extends CustomPainter {
  final Color color;

  HexagonFramePainter({this.color = colorGreen});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 2.r
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint paintShadow = Paint()
      ..strokeWidth = 4.r
      ..color = color
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4)
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(getDistortedHexagonPath(size), paintShadow);
    canvas.drawPath(getDistortedHexagonPath(size), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

Path getDistortedHexagonPath(Size size, {double distortionPercentage = 0.15}) {
  final path = Path();

  double radius = size.height / 2;
  Offset center = Offset(size.width / 2, size.height / 2);

  var angle = (pi * 2) / 6;
  Offset firstPoint =
      Offset(radius * cos(0.0 + pi / 2), radius * sin(0.0 + pi / 2));

  double distortionY = size.height * distortionPercentage;

  path.moveTo(firstPoint.dx + center.dx, firstPoint.dy + center.dy);
  path.lineTo(radius * cos(angle * 1 + pi / 2) + center.dx,
      radius * sin(angle * 1 + pi / 2) + center.dy);

  path.lineTo(radius * cos(angle * 2 + pi / 2) + center.dx,
      radius * sin(angle * 2 + pi / 2) + center.dy - distortionY);

  path.lineTo(radius * cos(angle * 3 + pi / 2) + center.dx,
      radius * sin(angle * 3 + pi / 2) + center.dy);

  path.lineTo(radius * cos(angle * 4 + pi / 2) + center.dx,
      radius * sin(angle * 4 + pi / 2) + center.dy - distortionY);

  path.lineTo(radius * cos(angle * 5 + pi / 2) + center.dx,
      radius * sin(angle * 5 + pi / 2) + center.dy);

  path.lineTo(radius * cos(angle * 6 + pi / 2) + center.dx,
      radius * sin(angle * 6 + pi / 2) + center.dy);

  path.close();

  return path;
}
