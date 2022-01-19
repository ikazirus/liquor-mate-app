import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

class BottleDetailsScreen extends StatelessWidget {
  static const String route = "/BottleDetailsScreen";
  const BottleDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Bottle Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          BottleImageHexagon(imageUrl: "imageUrl", width: 140.r, height: 160.r),
          SizedBox(
            height: 16.r,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
