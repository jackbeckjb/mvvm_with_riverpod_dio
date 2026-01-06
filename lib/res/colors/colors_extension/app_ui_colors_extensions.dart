import 'package:flutter/material.dart';

@immutable
class AppUiColors extends ThemeExtension<AppUiColors> {
  final Color primaryColor;
  final Color primaryColor50;
  final Color primaryColor80;
  final Color primaryGrayShade;
  final Color primaryHomeColor;
  final Color primaryShade;
  final Color settingBoxBgColor;
  final Color intputBgColor;
  final Color intputBgColor2;
  final Color intputSecondaryBgColor;
  final Color intputTertiaryBgColor;
  final Color secondaryColor;
  final Color secondaryColorFade;
  final Color lightBlue;

  final Color white;
  final Color black;
  final Color blackShadow;
  final Color whiteFade;
  final Color whiteExtraFade;
  final Color whiteExtremeFade;
  final Color whiteExtremestFade;
  final Color gray;
  final Color litestGray;
  final Color darkGray;

  final Color switchActiveColor;
  final Color switchDeActiveColor;
  final Color red;

  final Color gradientC1;
  final Color gradientC2;
  final Color gradientC3;

  const AppUiColors({
    required this.gradientC1,
    required this.gradientC2,
    required this.gradientC3,
    required this.primaryColor,
    required this.primaryColor50,
    required this.primaryColor80,
    required this.primaryGrayShade,
    required this.primaryHomeColor,
    required this.primaryShade,
    required this.settingBoxBgColor,
    required this.intputBgColor,
    required this.intputBgColor2,
    required this.intputSecondaryBgColor,
    required this.intputTertiaryBgColor,
    required this.secondaryColor,
    required this.secondaryColorFade,
    required this.lightBlue,

    required this.white,
    required this.black,
    required this.blackShadow,
    required this.whiteFade,
    required this.whiteExtraFade,
    required this.whiteExtremeFade,
    required this.whiteExtremestFade,
    required this.gray,
    required this.litestGray,
    required this.darkGray,

    required this.switchActiveColor,
    required this.switchDeActiveColor,
    required this.red,
  });

  @override
  AppUiColors copyWith({
    Color? gradientC1,
    Color? gradientC2,
    Color? gradientC3,
    Color? primaryColor,
    Color? primaryColor50,
    Color? primaryColor80,
    Color? primaryGrayShade,
    Color? primaryHomeColor,
    Color? primaryShade,
    Color? settingBoxBgColor,
    Color? intputBgColor,
    Color? intputBgColor2,
    Color? intputSecondaryBgColor,
    Color? intputTertiaryBgColor,
    Color? secondaryColor,
    Color? secondaryColorFade,
    Color? lightBlue,
    Color? slidingDotBlue,
    Color? slidingDotBlueOp50,
    Color? white,
    Color? black,
    Color? blackShadow,
    Color? whiteFade,
    Color? whiteExtraFade,
    Color? whiteExtremeFade,
    Color? whiteExtremestFade,
    Color? gray,
    Color? litestGray,
    Color? darkGray,

    Color? switchActiveColor,
    Color? switchDeActiveColor,
    Color? red,
  }) {
    return AppUiColors(
      gradientC1: gradientC1 ?? this.gradientC1,
      gradientC2: gradientC2 ?? this.gradientC2,
      gradientC3: gradientC3 ?? this.gradientC3,
      primaryColor: primaryColor ?? this.primaryColor,
      black: black ?? this.black,
      blackShadow: blackShadow ?? this.blackShadow,
      darkGray: darkGray ?? this.darkGray,
      gray: gray ?? this.gray,

      intputBgColor: intputBgColor ?? this.intputBgColor,
      intputBgColor2: intputBgColor2 ?? this.intputBgColor2,
      intputSecondaryBgColor:
          intputSecondaryBgColor ?? this.intputSecondaryBgColor,
      intputTertiaryBgColor:
          intputTertiaryBgColor ?? this.intputTertiaryBgColor,
      lightBlue: lightBlue ?? this.lightBlue,
      litestGray: litestGray ?? this.litestGray,

      primaryColor50: primaryColor50 ?? this.primaryColor50,
      primaryColor80: primaryColor80 ?? this.primaryColor80,
      primaryGrayShade: primaryGrayShade ?? this.primaryGrayShade,
      primaryHomeColor: primaryHomeColor ?? this.primaryHomeColor,
      primaryShade: primaryShade ?? this.primaryShade,
      red: red ?? this.red,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      secondaryColorFade: secondaryColorFade ?? this.secondaryColorFade,
      settingBoxBgColor: settingBoxBgColor ?? this.settingBoxBgColor,

      switchActiveColor: switchActiveColor ?? this.switchActiveColor,
      switchDeActiveColor: switchDeActiveColor ?? this.switchDeActiveColor,
      white: white ?? this.white,
      whiteExtraFade: whiteExtraFade ?? this.whiteExtraFade,
      whiteExtremeFade: whiteExtremeFade ?? this.whiteExtremeFade,
      whiteExtremestFade: whiteExtremestFade ?? this.whiteExtremestFade,
      whiteFade: whiteFade ?? this.whiteFade,
    );
  }

  @override
  AppUiColors lerp(ThemeExtension<AppUiColors>? other, double t) {
    if (other is! AppUiColors) return this;
    return AppUiColors(
      gradientC1: Color.lerp(gradientC1, other.gradientC1, t)!,
      gradientC2: Color.lerp(gradientC2, other.gradientC2, t)!,
      gradientC3: Color.lerp(gradientC3, other.gradientC3, t)!,
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      primaryColor50: Color.lerp(primaryColor50, other.primaryColor50, t)!,
      primaryColor80: Color.lerp(primaryColor80, other.primaryColor80, t)!,
      primaryGrayShade: Color.lerp(
        primaryGrayShade,
        other.primaryGrayShade,
        t,
      )!,
      primaryHomeColor: Color.lerp(
        primaryHomeColor,
        other.primaryHomeColor,
        t,
      )!,
      primaryShade: Color.lerp(primaryShade, other.primaryShade, t)!,
      settingBoxBgColor: Color.lerp(
        settingBoxBgColor,
        other.settingBoxBgColor,
        t,
      )!,
      intputBgColor: Color.lerp(intputBgColor, other.intputBgColor, t)!,
      intputBgColor2: Color.lerp(intputBgColor2, other.intputBgColor2, t)!,
      intputSecondaryBgColor: Color.lerp(
        intputSecondaryBgColor,
        other.intputSecondaryBgColor,
        t,
      )!,
      intputTertiaryBgColor: Color.lerp(
        intputTertiaryBgColor,
        other.intputTertiaryBgColor,
        t,
      )!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      secondaryColorFade: Color.lerp(
        secondaryColorFade,
        other.secondaryColorFade,
        t,
      )!,
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t)!,

      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      blackShadow: Color.lerp(blackShadow, other.blackShadow, t)!,
      whiteFade: Color.lerp(whiteFade, other.whiteFade, t)!,
      whiteExtraFade: Color.lerp(whiteExtraFade, other.whiteExtraFade, t)!,
      whiteExtremeFade: Color.lerp(
        whiteExtremeFade,
        other.whiteExtremeFade,
        t,
      )!,
      whiteExtremestFade: Color.lerp(
        whiteExtremestFade,
        other.whiteExtremestFade,
        t,
      )!,
      gray: Color.lerp(gray, other.gray, t)!,
      litestGray: Color.lerp(litestGray, other.litestGray, t)!,
      darkGray: Color.lerp(darkGray, other.darkGray, t)!,

      switchActiveColor: Color.lerp(
        switchActiveColor,
        other.switchActiveColor,
        t,
      )!,
      switchDeActiveColor: Color.lerp(
        switchDeActiveColor,
        other.switchDeActiveColor,
        t,
      )!,
      red: Color.lerp(red, other.red, t)!,
    );
  }
}
