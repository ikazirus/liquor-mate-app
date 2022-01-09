import 'dart:async';
import 'package:flutter/material.dart';
import 'package:liquor_mate/index.dart';

class SplashScreen extends StatefulWidget {
  static const String route = "/SplashScreen";
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    await Navigator.pushReplacementNamed(context, DashboardScreen.route);
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward().whenComplete(() => startTime());
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          assetImgLogo,
          width: animation.value * 200,
          height: animation.value * 200,
        ),
      ),
    );
  }
}
