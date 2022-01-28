import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

class ShopsHomeScreen extends StatelessWidget {
  static const String route = "/ShopsHomeScreen";
  const ShopsHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr("key")),
      ),
    );
  }
}
