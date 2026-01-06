import 'package:flutter/material.dart';
import 'package:mvvm_with_riverpod_dio/res/colors/colors_extension/app_ui_colors_extensions.dart';

extension ThemeX on BuildContext {
  // Adaptive colors from ThemeExtension
  AppUiColors get adaptiveColor => Theme.of(this).extension<AppUiColors>()!;
}
