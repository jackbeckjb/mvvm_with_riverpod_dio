import 'package:flutter_riverpod/legacy.dart';
import 'package:mvvm_with_riverpod_dio/data/models/user/user.dart';
import 'package:mvvm_with_riverpod_dio/data/network/api_response.dart';
import 'package:mvvm_with_riverpod_dio/data/repository/user/user_repo.dart';
import 'package:mvvm_with_riverpod_dio/viewModels/controller/user_controller/user_state.dart';

class UserController extends StateNotifier<UserState> {
  final UserRepo repository;
  UserController(this.repository) : super(UserState()) {
    // loadUsers();
  }

  Future<bool> loadUsers() async {
    // if (!_validate(email, password)) return false;
    state = state.copyWith(isLoading: true); // Fixed: Assign the new state
    final ApiResponse<List<User>> result = await repository.fetchUsers();
    if (result.success) {
      state = state.copyWith(
        users: result.data,
        message: "",
        isLoading: false, // Don't forget to set loading to false
      );
      return true;
    } else {
      state = state.copyWith(
        message: result.error ?? "Unknown error",
        isLoading: false,
      );
      return false;
    }
  }
}
