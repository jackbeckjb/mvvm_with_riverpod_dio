import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mvvm_with_riverpod_dio/core/providers/providers.dart';

class BearBottomNavScreen extends HookConsumerWidget {
  const BearBottomNavScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bearBottomNavProvider);
    final controller = ref.read(bearBottomNavProvider.notifier);
    final views = controller.views;

    return Scaffold(
      body: views[currentIndex].view,
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(views.length, (index) {
              final tab = views[index];
              final isActive = index == currentIndex;

              return GestureDetector(
                onTap: () => controller.setIndex(index),
                child: AnimatedContainer(
                  width: isActive ? 90.r : 50.r,
                  duration: const Duration(milliseconds: 500),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: isActive ? Colors.blue.shade50 : null,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Opacity(
                      //     opacity: isActive ? 1 : 0.5,
                      //     child: Image.asset(
                      //       tab.icon,
                      //       width: 24,
                      //       height: 24,
                      //       color: isActive ? Colors.blue : Colors.grey,
                      //     ),
                      //   ),
                      Opacity(
                        opacity: isActive ? 1 : 0.5,
                        child: Icon(
                          Icons.navigate_next_rounded,
                          color: isActive ? Colors.blue : Colors.grey,
                        ),
                      ),
                      if (isActive) ...[
                        const SizedBox(width: 4),
                        Text(
                          tab.title,
                          style: TextStyle(
                            color: isActive ? Colors.blue : Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
