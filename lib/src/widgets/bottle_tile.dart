import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';
import 'package:liquor_mate/src/widgets/bottle_image_hexagon.dart';

class BottleTile extends StatelessWidget {
  const BottleTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.r,
      width: 100.r,
      margin: EdgeInsets.all(8.r),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          BottleImageHexagon(
            imageUrl: "imageUrl",
            width: 60.r,
            height: 80.r,
          ),
          Positioned(
            top: 44.r,
            left: 0,
            right: 0,
            child: Container(
              width: 100.r,
              height: 80.r,
              decoration: BoxDecoration(
                gradient: whiteGradient,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          )
        ],
      ),
    );
  }
}
