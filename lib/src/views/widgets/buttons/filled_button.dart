import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const CustomFilledButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.r,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colorGreen,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            letterSpacing: 130,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
