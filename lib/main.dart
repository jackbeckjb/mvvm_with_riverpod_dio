import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_with_riverpod_dio/core/config/app_themes.dart';
import 'package:mvvm_with_riverpod_dio/core/config/environment.dart';
import 'package:mvvm_with_riverpod_dio/core/enums/app_environment_enum.dart';
import 'package:mvvm_with_riverpod_dio/core/enums/app_theme_mode_enum.dart';
import 'package:mvvm_with_riverpod_dio/core/providers/providers.dart';
import 'package:mvvm_with_riverpod_dio/res/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔥 Choose your environment here
  Environment.init(AppEnvironment.local);

  // 2️⃣ Apply custom HTTP overrides (allows self-signed SSL only in dev/local)
  // HttpOverrides.global = MyHttpOverrides();

  //  ApiClient().setTokens(access, refresh); // we need to place it at right place to save access token
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      child: MaterialApp.router(
        locale: const Locale('en', 'US'),

        title: 'Flutter Demo',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: themeMode.theme == AppThemeMode.dark
            ? ThemeMode.dark
            : ThemeMode.light,
        routerConfig: router,
      ),
    );
  }
}
