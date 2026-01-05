import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvvm_with_riverpod_dio/core/enums/app_theme_mode_enum.dart';

part 'theme_state.freezed.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  // if you want to eleminate copyWith then use freezed to generate boilerplat code
  const factory ThemeState({@Default(AppThemeMode.light) AppThemeMode theme}) =
      _ThemeState;
}
