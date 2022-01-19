import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

class BottleImageHexagon extends StatelessWidget {
  final String imageUrl;
  final Color? frameColor;
  final double width;
  final double height;

  const BottleImageHexagon(
      {Key? key,
      required this.imageUrl,
      this.frameColor,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.r + 16.r,
      height: height.r,
      padding: EdgeInsets.all(4.r),
      child: CustomPaint(
        painter: HexagonFramePainter(color: frameColor ?? colorGreen),
        child: Container(
          padding: EdgeInsets.only(top: 4.r, left: 0, right: 0, bottom: 4.r),
          width: width.r,
          height: height.r,
          child: ClipPath(
            clipper: HexagonClipper(),
            child: Container(
              color: Colors.white,
              child: Image.asset(
                "assets/images/sample.png",
                fit: BoxFit.cover,
                height: height.r,
                width: width.r,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
