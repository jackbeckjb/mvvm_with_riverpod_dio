import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  const BottomNavScreen({
    super.key,
    required this.children,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBranchContainer(
        currentIndex: navigationShell.currentIndex,
        children: children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Task'),
        ],
      ),
    );

    // return Scaffold(
    //   body: views[currentIndex].view,
    //   bottomNavigationBar: SafeArea(
    //     child: Container(
    //       margin: const EdgeInsets.all(12),
    //       padding: EdgeInsets.symmetric(horizontal: 10.w),
    //       height: 60,
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(20),
    //         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: List.generate(views.length, (index) {
    //           final tab = views[index];
    //           final isActive = index == currentIndex;

    //           return GestureDetector(
    //             onTap: () => controller.setIndex(index),
    //             child: AnimatedContainer(
    //               width: isActive ? 90.r : 50.r,
    //               duration: const Duration(milliseconds: 500),
    //               padding: const EdgeInsets.symmetric(horizontal: 12),
    //               decoration: BoxDecoration(
    //                 color: isActive ? Colors.blue.shade50 : null,
    //                 borderRadius: BorderRadius.circular(20.r),
    //               ),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   // Opacity(
    //                   //     opacity: isActive ? 1 : 0.5,
    //                   //     child: Image.asset(
    //                   //       tab.icon,
    //                   //       width: 24,
    //                   //       height: 24,
    //                   //       color: isActive ? Colors.blue : Colors.grey,
    //                   //     ),
    //                   //   ),
    //                   Opacity(
    //                     opacity: isActive ? 1 : 0.5,
    //                     child: Icon(
    //                       Icons.navigate_next_rounded,
    //                       color: isActive ? Colors.blue : Colors.grey,
    //                     ),
    //                   ),
    //                   if (isActive) ...[
    //                     const SizedBox(width: 4),
    //                     Text(
    //                       tab.title,
    //                       style: TextStyle(
    //                         color: isActive ? Colors.blue : Colors.grey,
    //                         fontWeight: FontWeight.w600,
    //                       ),
    //                     ),
    //                   ],
    //                 ],
    //               ),
    //             ),
    //           );
    //         }),
    //       ),
    //     ),
    //   ),
    // );
  }
}

/// Custom branch Navigator container that provides animated transitions
/// when switching branches.
class AnimatedBranchContainer extends StatelessWidget {
  /// Creates a AnimatedBranchContainer
  const AnimatedBranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
  });

  /// The index (in [children]) of the branch Navigator to display.
  final int currentIndex;

  /// The children (branch Navigators) to display in this container.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children.mapIndexed((int index, Widget navigator) {
        return AnimatedScale(
          scale: index == currentIndex ? 1 : 1.3,
          curve: Curves.easeInCirc,
          duration: const Duration(milliseconds: 400),
          child: AnimatedOpacity(
            curve: Curves.easeInCirc,
            opacity: index == currentIndex ? 1 : 0,
            duration: const Duration(milliseconds: 400),
            // child: _branchNavigatorWrapper(index, navigator),
            child: navigator,
          ),
        );
      }).toList(),
    );
  }

  Widget _branchNavigatorWrapper(int index, Widget navigator) => IgnorePointer(
    // ignoring: index != currentIndex,
    child: TickerMode(enabled: index == currentIndex, child: navigator),
  );
}
