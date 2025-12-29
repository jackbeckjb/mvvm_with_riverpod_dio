import 'package:flutter/cupertino.dart';
import 'package:mvvm_with_riverpod_dio/view/screens/login_screen.dart';

class SplashService {
  SplashService();

  void initApp(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              LoginScreen(),
        ),
      );
    });
  }
}
