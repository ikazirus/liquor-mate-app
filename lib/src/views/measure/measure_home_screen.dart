import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

class MeasureHomeScreen extends StatelessWidget {
  static const String route = "/MeasureHomeScreen";
  const MeasureHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Measure"),
      ),
    );
  }
}
