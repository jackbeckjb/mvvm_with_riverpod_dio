import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SplashService {
  SplashService();

  void initApp(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      context.go("/login");
    });
  }
}
