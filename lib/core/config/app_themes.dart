import 'package:flutter/material.dart';
import 'package:mvvm_with_riverpod_dio/res/colors/app_colors.dart';
import 'package:mvvm_with_riverpod_dio/res/colors/colors_extension/app_ui_colors_extensions.dart';
import 'package:mvvm_with_riverpod_dio/res/colors/colors_extension/semantic_color_extensions.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),

    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    extensions: [
      AppSemanticColors(
        success: AppColors.success,
        warning: AppColors.warning,
        info: AppColors.info,
      ),

      AppUiColors(
        primaryColor: AppColors.primaryColor,
        primaryColor50: AppColors.primaryColor50,
        primaryColor80: AppColors.primaryColor80,
        primaryGrayShade: AppColors.primaryGrayShade,
        primaryHomeColor: AppColors.primaryHomeColor,
        primaryShade: AppColors.primaryShade,
        secondaryColor: AppColors.secondaryColor,
        secondaryColorFade: AppColors.secondaryColorFade,
        settingBoxBgColor: AppColors.settingBoxBgColor,
        intputBgColor: AppColors.intputBgColor,
        intputBgColor2: AppColors.intputBgColor2,
        intputSecondaryBgColor: AppColors.intputSecondaryBgColor,
        intputTertiaryBgColor: AppColors.intputTertiaryBgColor,
        lightBlue: AppColors.lightBlue,
        black: AppColors.black,
        blackShadow: AppColors.blackShadow,
        white: AppColors.white,
        whiteFade: AppColors.whiteFade,
        whiteExtraFade: AppColors.whiteExtraFade,
        whiteExtremeFade: AppColors.whiteExtremeFade,
        whiteExtremestFade: AppColors.whiteExtremestFade,
        gray: AppColors.gray,
        litestGray: AppColors.litestGray,
        darkGray: AppColors.darkGray,
        switchDeActiveColor: AppColors.switchDeActiveColor,
        switchActiveColor: AppColors.switchActiveColor,

        red: AppColors.red,
        gradientC1: AppColors.gc1,
        gradientC2: AppColors.gc2,
        gradientC3: AppColors.gc3,
      ),
    ],
    cardTheme: CardThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.black),
      elevation: 0,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.intputSecondaryBgColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.blue,
    ),
    extensions: [
      AppSemanticColors(
        success: AppColors.success,
        warning: AppColors.warning,
        info: AppColors.info,
      ),
      //  here we need to reverse the colors for the dark theme according to the design
      AppUiColors(
        primaryColor: AppColors.primaryColor,
        primaryColor50: AppColors.primaryColor50,
        primaryColor80: AppColors.primaryColor80,
        primaryGrayShade: AppColors.primaryGrayShade,
        primaryHomeColor: AppColors.primaryHomeColor,
        primaryShade: AppColors.primaryShade,
        secondaryColor: AppColors.secondaryColor,
        secondaryColorFade: AppColors.secondaryColorFade,
        settingBoxBgColor: AppColors.settingBoxBgColor,
        intputBgColor: AppColors.intputBgColor,
        intputBgColor2: AppColors.intputBgColor2,
        intputSecondaryBgColor: AppColors.intputSecondaryBgColor,
        intputTertiaryBgColor: AppColors.intputTertiaryBgColor,
        lightBlue: AppColors.lightBlue,
        black: AppColors.white, // black to white
        blackShadow: AppColors.whiteFade,
        white: AppColors.black,
        whiteFade: AppColors.whiteFade,
        whiteExtraFade: AppColors.whiteExtraFade,
        whiteExtremeFade: AppColors.whiteExtremeFade,
        whiteExtremestFade: AppColors.whiteExtremestFade,
        gray: AppColors.gray,
        litestGray: AppColors.litestGray,
        darkGray: AppColors.darkGray,
        switchDeActiveColor: AppColors.switchDeActiveColor,
        switchActiveColor: AppColors.switchActiveColor,

        red: AppColors.red,
        gradientC1: AppColors.gc1,
        gradientC2: AppColors.gc2,
        gradientC3: AppColors.gc3,
      ),
    ],
    cardTheme: CardThemeData(color: AppColors.darkGray),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.white),
    ),
  );
}
