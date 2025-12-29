import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  // if you want to eleminate copyWith then use freezed to generate boilerplat code
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool rememberMe,
    String? emailError,
    String? passwordError,
  }) = _LoginState;
}
