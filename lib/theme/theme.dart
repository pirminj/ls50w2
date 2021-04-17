import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../settings/settings.dart';
import 'colors.dart';

/// Provide the theme based on the selected [ModelColor]
final themeProvider = Provider<ThemeData>((ref) {
  final modelColor = ref.watch(Settings.provider).modelColor;
  switch (modelColor) {
    case ModelColor.mineralWhite:
      return mineralWhiteTheme;
    case ModelColor.carbonBlack:
      return carbonBlackTheme;
    case ModelColor.titaniumGrey:
      return titaniumGreyTheme;
    case ModelColor.crimsonRed:
      return crimsonRedTheme;
  }
});

final defaultDarkTheme = ThemeData.dark();

ThemeData constructThemeFromColors(ColorSet colorSet) {
  return ThemeData(
    primaryColor: colorSet.primaryColor,
    primaryColorDark: colorSet.primaryDarkColor,
    primaryColorLight: colorSet.primaryLightColor,
    accentColor: colorSet.secondaryColor,
    accentIconTheme: IconThemeData(
      color: colorSet.secondaryColor,
    ),
    shadowColor: colorSet.secondaryColor,
    scaffoldBackgroundColor: colorSet.primaryLightColor,
    textTheme: defaultDarkTheme.textTheme.apply(
      bodyColor: colorSet.primaryTextColor,
      displayColor: colorSet.primaryTextColor,
    ),
    brightness: colorSet.brightness,
    iconTheme: IconThemeData(
      color: colorSet.primaryTextColor,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    cardColor: colorSet.primaryColor,
    dialogTheme: DialogTheme(
      backgroundColor: colorSet.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: Colors.green,
      hoverColor: Colors.green,
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => colorSet.secondaryDarkColor,
        ),
      ),
    ),
  );
}

final MineralWhite mineralWhiteColors = MineralWhite();
final CarbonBlack carbonBlackColors = CarbonBlack();
final TitaniumGrey titaniumGreyColors = TitaniumGrey();
final CrimsonRed crimsonRedColors = CrimsonRed();

final ThemeData mineralWhiteTheme =
    constructThemeFromColors(mineralWhiteColors).copyWith(
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateColor.resolveWith(
        (states) => mineralWhiteColors.secondaryDarkColor,
      ),
    ),
  ),
);

final ThemeData carbonBlackTheme =
    constructThemeFromColors(carbonBlackColors).copyWith(
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateColor.resolveWith(
        (states) => carbonBlackColors.secondaryLightColor,
      ),
    ),
  ),
);

final ThemeData titaniumGreyTheme =
    constructThemeFromColors(titaniumGreyColors).copyWith(
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateColor.resolveWith(
        (states) => titaniumGreyColors.secondaryLightColor,
      ),
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: titaniumGreyColors.primaryDarkColor,
  ),
);

final ThemeData crimsonRedTheme =
    constructThemeFromColors(crimsonRedColors).copyWith(
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateColor.resolveWith(
        (states) => crimsonRedColors.secondaryLightColor,
      ),
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: crimsonRedColors.primaryDarkColor,
  ),
  accentIconTheme: IconThemeData(
    color: crimsonRedColors.primaryTextColor,
  ),
  shadowColor: crimsonRedColors.secondaryLightColor,
);
