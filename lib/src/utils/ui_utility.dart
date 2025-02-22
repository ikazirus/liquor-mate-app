import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UI {
  static double width = 0;
  static double height = 0;
  static double hpx = 0;
  static double wpx = 0;
  static double ratio = 1;
  static double deviceUIvalue = 0;
  static bool isLandscape = false;
  static bool isWeb = false;

  static TextTheme textTheme = TextTheme();

  static void initialize(context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    hpx = height * MediaQuery.of(context).devicePixelRatio;
    wpx = width * MediaQuery.of(context).devicePixelRatio;
    isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    isWeb = kIsWeb;

    textTheme = Theme.of(context).textTheme;

    if (isWeb) {
      ratio = 1;
    } else {
      deviceUIvalue = pow((pow(width, 2) + pow(height, 2)), 0.5).toDouble();
      ratio = deviceUIvalue / 929.7505041676503;
    }

    if (kDebugMode) {
      debugPrint('''

Width (viewport)  = $width
Height (viewport) = $height
Width(in pixels)  = $wpx
Height(in pixels) = $hpx
UI Value          = $deviceUIvalue
Ratio             = $ratio

        ''');
    }
  }
}

extension SizerExt on num {
  /// Calculates the sp (Scalable Pixel) depending on the device's screen size (ratio)
  double get r => this * UI.ratio;
}
