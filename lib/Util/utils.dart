import 'package:flutter/cupertino.dart';

class SizeConfig {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? blockSizeHorizontal;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    blockSizeHorizontal = (screenWidth!) / 100;
  }
}
