import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mvvm_with_riverpod_dio/core/providers/providers.dart';
import 'package:mvvm_with_riverpod_dio/viewModels/service/splash_service.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late final SplashService splashService;
  @override
  void initState() {
    splashService = ref.read(splashServiceProvider);
    splashService.initApp(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Splash')));
  }
}
