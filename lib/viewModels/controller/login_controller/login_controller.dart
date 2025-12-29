import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mvvm_with_riverpod_dio/view/screens/home_screen.dart';

import 'login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(const LoginState());

  void toggleRememberMe() {
    state = state.copyWith(rememberMe: !state.rememberMe);
  }

  // Validate inputs
  bool _validate(String email, String password) {
    String? emailError;
    String? passwordError;

    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      emailError = "Invalid email";
    }
    if (password.length < 6) {
      passwordError = "Password must be at least 6 chars";
    }

    state = state.copyWith(
      emailError: emailError,
      passwordError: passwordError,
    );

    return emailError == null && passwordError == null;
  }

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    bool isValid = _validate(email, password);
    if (!isValid) return;

    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 2)); // Fake API call

    // For demo, always succeed
    state = state.copyWith(isLoading: false);
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
      ),
    );

    // You could store rememberMe in local storage here if needed
  }
}
