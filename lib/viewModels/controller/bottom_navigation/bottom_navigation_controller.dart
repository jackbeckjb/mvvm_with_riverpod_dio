import 'package:flutter_riverpod/legacy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mvvm_with_riverpod_dio/data/models/bottom_navigation/bottom_navigation_model.dart';
import 'package:mvvm_with_riverpod_dio/view/screens/home_screen.dart';
import 'package:mvvm_with_riverpod_dio/view/screens/task_screen.dart';

class BearBottomNavController extends StateNotifier<int> {
  BearBottomNavController([super.initialIndex = 0]);

  int activityTabIndex = 0;

  void setIndex(int index) => state = index;

  void setActivityTabIndex(int value) {
    activityTabIndex = value;
  }

  void resetIndex() => state = 0;

  /// Returns the list of views with dynamic activity tab index
  List<BottomNavigationModel> get views => [
    BottomNavigationModel(
      title: "Home",
      icon: "assets/icons/home.png",
      view: HomeScreen(),
    ),
    // BottomNavigationModel(
    //   title: "Activity",
    //   icon: "assets/icons/activity.png",
    //   view: ActivityScreen(initialTabIndex: activityTabIndex),
    // ),
    // BottomNavigationModel(
    //   title: "Analytics",
    //   icon: "assets/icons/analytics.png",
    //   view: AnalyticsScreen(),
    // ),
    BottomNavigationModel(
      title: "Task",
      icon: "assets/icons/profile.png",
      view: TaskScreen(),
    ),
  ];

  BottomNavigationModel get currentView => views[state];
}
