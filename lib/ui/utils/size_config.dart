import 'package:flutter/material.dart';

/// SizeConfig to make project scalable
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double sw;
  static late double sh;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double safeAreaHorizontal;
  static late double safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  static late double profileDrawerWidth;
  static late double refHeight;
  static late double refWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    sw = _mediaQueryData.size.width;
    sh = _mediaQueryData.size.height;
    refHeight = 667;
    refWidth = 375;

    if (sh < 1200) {
      blockSizeHorizontal = sw / 100;
      blockSizeVertical = sh / 100;

      safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
      safeBlockHorizontal = (sw - safeAreaHorizontal) / 100;
      safeBlockVertical = (sh - safeAreaVertical) / 100;
    } else {
      blockSizeHorizontal = sw / 120;
      blockSizeVertical = sh / 120;

      safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
      safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
      safeBlockHorizontal = (sw - safeAreaHorizontal) / 120;
      safeBlockVertical = (sh - safeAreaVertical) / 120;
    }
  }

  static double getWidthRatio(double val) {
    double res = (val / refWidth) * 100;
    double temp = res * blockSizeHorizontal;

    return temp;
  }

  static double getHeightRatio(double val) {
    double res = (val / refHeight) * 100;
    double temp = res * blockSizeVertical;
    return temp;
  }

  static double getFontRatio(double val) {
    double res = (val / refWidth) * 100;
    double temp = 0.0;
    if (sw < sh) {
      temp = res * safeBlockHorizontal;
    } else {
      temp = res * safeBlockVertical;
    }

    return temp;
  }
}

extension SizeUtils on num {
  double get toWidth => SizeConfig.getWidthRatio(toDouble());

  double get toHeight => SizeConfig.getHeightRatio(toDouble());

  double get toFont => SizeConfig.getFontRatio(toDouble());
}
