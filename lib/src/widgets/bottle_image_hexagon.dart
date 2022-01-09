import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

import 'package:liquor_mate/src/widgets/custom_painters/hexagon.dart';

class BottleImageHexagon extends StatelessWidget {
  final String imageUrl;
  final Color? frameColor;
  final double width;
  final double height;

  const BottleImageHexagon(
      {Key? key,
      required this.imageUrl,
      this.frameColor,
      this.width = 80,
      this.height = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.r,
      height: height.r,
      padding: EdgeInsets.all(4.r),
      child: CustomPaint(
        painter: HexagonFramePainter(color: frameColor ?? colorGreen),
        child: Padding(
          padding: EdgeInsets.all(4.0.r),
          child: ClipPath(
            clipper: HexagonClipper(),
            child: Image.asset(
              "assets/images/sample.jpg",
              fit: BoxFit.cover,
              height: height.r,
              width: width.r,
            ),
          ),
        ),
      ),
    );
  }
}
