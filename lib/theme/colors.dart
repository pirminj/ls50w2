import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

final mineralWhite = Color(0xfff2f1eb);
final copperWhite = Color(0xffaa6e4f);

final carbonBlack = Color(0xff1b1f20);

abstract class ColorSet {
  Color get primaryColor;
  Color get primaryLightColor;
  Color get primaryDarkColor;
  Color get secondaryColor;
  Color get secondaryLightColor;
  Color get secondaryDarkColor;
  Color get primaryTextColor;
  Brightness get brightness;
}

/// https://material.io/resources/color/#!/?view.left=0&view.right=0&primary.color=1b1f20&secondary.color=aa6d4f
class CarbonBlack implements ColorSet {
  Color get primaryColor => Color(0xff1b1f20);
  Color get primaryLightColor => Color(0xff424647);
  Color get primaryDarkColor => Color(0xff000000);
  Color get secondaryColor => Color(0xffaa6d4f);
  Color get secondaryLightColor => Color(0xffde9c7b);
  Color get secondaryDarkColor => Color(0xff784126);
  Color get primaryTextColor => Color(0xffffffff);
  Color get secondaryTextColor => Color(0xff000000);
  Brightness get brightness => Brightness.dark;
}

/// https://material.io/resources/color/#!/?view.left=0&view.right=0&primary.color=f7f6f0&secondary.color=aa6d4f
class MineralWhite implements ColorSet {
  Color get primaryColor => Color(0xfff7f6f0);
  Color get primaryLightColor => Color(0xffffffff);
  Color get primaryDarkColor => Color(0xffc4c3be);
  Color get secondaryColor => Color(0xffaa6d4f);
  Color get secondaryLightColor => Color(0xffde9c7b);
  Color get secondaryDarkColor => Color(0xff784126);
  Color get primaryTextColor => Color(0xff000000);
  Color get secondaryTextColor => Color(0xff000000);
  Brightness get brightness => Brightness.light;
}

/// https://material.io/resources/color/#!/?view.left=0&view.right=0&primary.color=555452&secondary.color=771919
class TitaniumGrey implements ColorSet {
  Color get primaryColor => Color(0xff555452);
  Color get primaryLightColor => Color(0xff81807e);
  Color get primaryDarkColor => Color(0xff2c2b2a);
  Color get secondaryColor => Color(0xff771919);
  Color get secondaryLightColor => Color(0xffab4840);
  Color get secondaryDarkColor => Color(0xff470000);
  Color get primaryTextColor => Color(0xffffffff);
  Color get secondaryTextColor => Color(0xffffffff);
  Brightness get brightness => Brightness.dark;
}

/// https://material.io/resources/color/#!/?view.left=0&view.right=0&primary.color=851f21&secondary.color=6d6461
class CrimsonRed implements ColorSet {
  Color get primaryColor => Color(0xff851f21);
  Color get primaryLightColor => Color(0xffba4f49);
  Color get primaryDarkColor => Color(0xff530000);
  Color get secondaryColor => Color(0xff6d6461);
  Color get secondaryLightColor => Color(0xff9b928e);
  Color get secondaryDarkColor => Color(0xff423a37);
  Color get primaryTextColor => Color(0xffffffff);
  Color get secondaryTextColor => Color(0xffffffff);
  Brightness get brightness => Brightness.light;
}
