import 'package:calories_fix/core/constants/ui_screen_sizes.dart';
import 'package:calories_fix/core/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';

class ResponsiveConfig {
  static late double widthRatio;
  static late double heightRatio;

  static void init(BuildContext context) {
    widthRatio = context.screenWidth / UiScreenSizes.uiScreenWidth;
    heightRatio = context.screenHeight / UiScreenSizes.uiScreenHeight;
  }
}
