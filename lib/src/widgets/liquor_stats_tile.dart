import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';
import 'package:liquor_mate/src/widgets/bottle_image_hexagon.dart';

class LiquorStatsTile extends StatelessWidget {
  const LiquorStatsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 12.r),
      child: Stack(
        children: [
          BottleImageHexagon(
            imageUrl: "imageUrl",
            frameColor: colorTag2,
            height: 100,
            width: 80,
          ),
          Positioned(
            left: 50.r,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 58.r,
                right: 8.r,
                top: 8.r,
                bottom: 8.r,
              ),
              height: 200.r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Absinthe 170ml",
                    style: TextStyle(
                      color: colorWhite,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: whiteGradientRtL,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
