import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

class DashboardButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final String icon;
  final double? size;
  const DashboardButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.icon,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: size ?? 72.r,
          width: (size ?? 72.r) * 1.5,
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            gradient: whiteGradient,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  color: colorGreen,
                  height: 24.r,
                ),
                SizedBox(
                  height: 16.r,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: colorWhite,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
