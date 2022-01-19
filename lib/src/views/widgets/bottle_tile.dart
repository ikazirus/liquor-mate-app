import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

class BottleTile extends StatelessWidget {
  const BottleTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(BottleDetailsScreen.route),
      child: Container(
        height: 150.r,
        width: 120.r,
        margin: EdgeInsets.all(4.r),
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
                width: 120.r,
                height: 90.r,
                decoration: BoxDecoration(
                  gradient: whiteGradient,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.r,
                    ),
                    Text(
                      "Bottle Name",
                      style: TextStyle(
                        color: colorWhite,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.r,
                      ),
                    ),
                    Text(
                      "1000ml",
                      style: TextStyle(
                        color: colorGreen,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
