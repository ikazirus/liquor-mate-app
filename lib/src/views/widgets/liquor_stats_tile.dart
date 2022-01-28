import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

class LiquorStatsTile extends StatelessWidget {
  const LiquorStatsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 12.r),
      height: 136.r,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            left: 50.r,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 58.r,
                right: 8.r,
                top: 8.r,
                bottom: 8.r,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Absinthe (175ml)",
                    style: TextStyle(
                      color: colorWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Whiskey",
                    style: TextStyle(
                      color: colorGreen,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                  Divider(
                    color: colorGrey,
                    thickness: 0.4,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr("dashboard.available_vol"),
                              style: TextStyle(
                                color: colorGrey,
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "1789900 ml",
                              style: TextStyle(
                                color: colorWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 8.r,
                            ),
                            Text(
                              tr("dashboard.no_of_bottles"),
                              style: TextStyle(
                                color: colorGrey,
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "560",
                              style: TextStyle(
                                color: colorWhite,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8.r,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tr("dashboard.today_usage"),
                              style: TextStyle(
                                color: colorGrey,
                                fontWeight: FontWeight.w200,
                                fontSize: 8,
                              ),
                            ),
                            Text(
                              "180",
                              style: TextStyle(
                                color: colorWhite,
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(
                              height: 8.r,
                            ),
                            Text(
                              tr("dashboard.avg_usage"),
                              style: TextStyle(
                                color: colorGrey,
                                fontWeight: FontWeight.w200,
                                fontSize: 8,
                              ),
                            ),
                            Text(
                              "17900 ml/Day",
                              style: TextStyle(
                                color: colorWhite,
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                gradient: whiteGradientRtL,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          BottleImageHexagon(
            imageUrl: "imageUrl",
            frameColor: colorTag5,
            height: 100,
            width: 80,
          ),
        ],
      ),
    );
  }
}
