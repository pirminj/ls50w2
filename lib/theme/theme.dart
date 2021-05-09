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
    toggleableActiveColor: colorSet.secondaryColor,
    scaffoldBackgroundColor: colorSet.primaryColor,
    textTheme: defaultDarkTheme.textTheme.apply(
      bodyColor: colorSet.primaryTextColor,
      displayColor: colorSet.primaryTextColor,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: colorSet.secondaryColor,
      selectionColor: colorSet.secondaryLightColor,
      selectionHandleColor: colorSet.secondaryColor,
    ),
    brightness: colorSet.brightness,
    iconTheme: IconThemeData(
      color: colorSet.primaryTextColor,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: colorSet.primaryColor,
    ),
    cardColor: colorSet.secondaryColor,
    dialogTheme: DialogTheme(
      backgroundColor: colorSet.primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: colorSet.secondaryColor),
      ),
      focusColor: colorSet.secondaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => colorSet.secondaryColor,
        ),
      ),
    ),
    sliderTheme: SliderThemeData.fromPrimaryColors(
      primaryColor: colorSet.secondaryColor,
      primaryColorDark: colorSet.secondaryDarkColor,
      primaryColorLight: colorSet.secondaryLightColor,
      valueIndicatorTextStyle: TextStyle(),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: StadiumBorder(
        side: BorderSide(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateColor.resolveWith(
          (states) => colorSet.secondaryLightColor,
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

final ThemeData carbonBlackTheme = constructThemeFromColors(carbonBlackColors);

final ThemeData titaniumGreyTheme =
    constructThemeFromColors(titaniumGreyColors).copyWith(
  dialogTheme: DialogTheme(
    backgroundColor: titaniumGreyColors.primaryDarkColor,
  ),
);

final ThemeData crimsonRedTheme =
    constructThemeFromColors(crimsonRedColors).copyWith(
  dialogTheme: DialogTheme(
    backgroundColor: crimsonRedColors.primaryDarkColor,
  ),
  accentIconTheme: IconThemeData(
    color: crimsonRedColors.primaryTextColor,
  ),
);
