// import 'package:get/get_navigation/src/routes/get_route.dart';
// import 'package:get/get_navigation/src/routes/transitions_type.dart';
// import 'package:mvvm_with_riverpod_dio/core/service_locator.dart';
// import 'package:mvvm_with_riverpod_dio/res/routes/routes_name.dart';
// import 'package:mvvm_with_riverpod_dio/view/screens/home_screen.dart';
// import 'package:mvvm_with_riverpod_dio/view/screens/splash.dart';

// class AppRoutes {
//   static appRoutes() => [
//     GetPage(
//       name: RoutesName.splashScreen,
//       page: () => SplashScreen(service: getIt()),

//       transition: Transition.fade,
//       transitionDuration: const Duration(microseconds: 250),
//     ),
//     GetPage(
//       name: RoutesName.homeView,
//       page: () => HomeScreen(controller: getIt()),
//       transition: Transition.fade,
//       transitionDuration: const Duration(microseconds: 250),
//     ),
//   ];
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_with_riverpod_dio/view/screens/bottom_navigation_screen.dart';
import 'package:mvvm_with_riverpod_dio/view/screens/home_screen.dart';
import 'package:mvvm_with_riverpod_dio/view/screens/login_screen.dart';
import 'package:mvvm_with_riverpod_dio/view/screens/splash.dart';
import 'package:mvvm_with_riverpod_dio/view/screens/task_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _tabANavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'tabANav',
);
final GlobalKey<NavigatorState> _tabBNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'tabBNav',
);

final GoRouter router = GoRouter(
  initialLocation: "/",
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      name: "SplashScreen",
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: "LoginScreen",
      builder: (context, state) => const LoginScreen(),
    ),
    // Persistent bottom navigation shell
    StatefulShellRoute(
      branches: [
        StatefulShellBranch(
          navigatorKey: _tabANavigatorKey,
          routes: [
            GoRoute(
              path: '/home',
              name: "HomeScreen",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _tabBNavigatorKey,
          routes: [
            GoRoute(
              path: '/task',
              name: "TaskScreen",
              builder: (context, state) => const TaskScreen(),
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) {
        return navigationShell;
      },

      navigatorContainerBuilder:
          (
            BuildContext context,
            StatefulNavigationShell navigationShell,
            List<Widget> children,
          ) {
            return BottomNavScreen(
              navigationShell: navigationShell,
              children: children,
            );
          },
    ),
  ],
);


// // Nested Routes (Child Pages)
// GoRoute(
//   path: '/dashboard',
//   builder: (context, state) => const DashboardScreen(),
//   routes: [
//     GoRoute(
//       path: 'settings',
//       builder: (context, state) => const SettingsScreen(),
//     ),
//   ],
// ),
// context.push('/dashboard/settings');