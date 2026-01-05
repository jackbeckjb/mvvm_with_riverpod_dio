import 'package:flutter_riverpod/legacy.dart';
import 'package:mvvm_with_riverpod_dio/core/enums/app_theme_mode_enum.dart';
import 'package:mvvm_with_riverpod_dio/viewModels/controller/theme/theme_state.dart';

class ThemeController extends StateNotifier<ThemeState> {
  ThemeController() : super(const ThemeState());

  void toggleTheme() {
    state = state.copyWith(
      theme: state.theme == AppThemeMode.light
          ? AppThemeMode.dark
          : AppThemeMode.light,
    );
  }
}
