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
    scaffoldBackgroundColor: colorSet.primaryLightColor,
    textTheme: defaultDarkTheme.textTheme.apply(
      bodyColor: colorSet.primaryTextColor,
      displayColor: colorSet.primaryTextColor,
    ),
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

final ThemeData mineralWhiteTheme = constructThemeFromColors(MineralWhite());

final ThemeData carbonBlackTheme = constructThemeFromColors(CarbonBlack());

final ThemeData titaniumGreyTheme = constructThemeFromColors(TitaniumGrey());

final ThemeData crimsonRedTheme = constructThemeFromColors(CrimsonRed());
