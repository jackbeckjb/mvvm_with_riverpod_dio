import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mvvm_with_riverpod_dio/data/network/api_client.dart';
import 'package:mvvm_with_riverpod_dio/data/network/network_api_service.dart';
import 'package:mvvm_with_riverpod_dio/data/repository/user/user_repo.dart';
import 'package:mvvm_with_riverpod_dio/viewModels/controller/login_controller/login_controller.dart';
import 'package:mvvm_with_riverpod_dio/viewModels/controller/login_controller/login_state.dart';
import 'package:mvvm_with_riverpod_dio/viewModels/controller/user_controller/user_controller.dart';
import 'package:mvvm_with_riverpod_dio/viewModels/controller/user_controller/user_state.dart';
import 'package:mvvm_with_riverpod_dio/viewModels/service/splash_service.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(); // singleton instance
});

final dioProvider = Provider<Dio>((ref) {
  return ref.read(apiClientProvider).client;
});

final splashServiceProvider = Provider<SplashService>((ref) {
  return SplashService();
});

final networkApiServiceProvider = Provider<NetworkApiServices>((ref) {
  final dio = ref.read(dioProvider);
  return NetworkApiServices(dio);
});

// User Repository
final userRepositoryProvider = Provider<UserRepo>((ref) {
  final api = ref.read(networkApiServiceProvider);
  return UserRepo(api);
});

// User Controller
final userControllerProvider = StateNotifierProvider<UserController, UserState>(
  (ref) {
    final repo = ref.read(userRepositoryProvider);
    return UserController(repo);
  },
);

// login Controller
final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginState>((ref) {
      ref.onDispose(() {
        debugPrint("Login Controller Dispose");
      });
      return LoginController();
    });
