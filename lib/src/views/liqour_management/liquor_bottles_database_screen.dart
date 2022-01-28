import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

class LiquorBottleDatabaseScreen extends StatelessWidget {
  static const String route = "/LiquorBottleDatabaseScreen";
  const LiquorBottleDatabaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottle Database"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black12,
            width: double.infinity,
            height: 80,
          ),
          SizedBox(
            height: 16.r,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Wrap(
              children: List.generate(50, (index) => BottleTile()),
            ),
          ))
        ],
      ),
    );
  }
}
