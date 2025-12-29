import 'package:mvvm_with_riverpod_dio/data/models/user/user.dart';

class UserState {
  final bool isLoading;
  final String? emailError;
  final String? passwordError;
  final List<User>? users;
  final String? message;

  const UserState({
    this.users,
    this.isLoading = false,
    this.emailError,
    this.passwordError,
    this.message,
  });

  UserState copyWith({
    bool? isLoading,
    String? emailError,
    String? message,
    String? passwordError,
    List<User>? users,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      emailError: emailError,
      message: message ?? this.message,
      passwordError: passwordError,
    );
  }
}
