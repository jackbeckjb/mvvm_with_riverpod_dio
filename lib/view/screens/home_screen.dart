import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mvvm_with_riverpod_dio/core/enums/app_theme_mode_enum.dart';
import 'package:mvvm_with_riverpod_dio/core/providers/providers.dart';
import 'package:mvvm_with_riverpod_dio/res/colors/app_colors.dart';
import 'package:mvvm_with_riverpod_dio/res/fonts/app_fonts.dart';
import 'package:mvvm_with_riverpod_dio/utils/utils.dart';
import 'package:mvvm_with_riverpod_dio/view/components/exception/general_exceptions.dart';
import 'package:mvvm_with_riverpod_dio/view/components/exception/internet_exceptions.dart';
import 'package:mvvm_with_riverpod_dio/viewModels/controller/theme/theme_state.dart';
import 'package:mvvm_with_riverpod_dio/viewModels/controller/user_controller/user_controller.dart';

// Exmple 1: the api calling from controller constructor
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print("hello ");
//     // useEffect(() {
//     // useEffect=> 1.“Here is the code I want to run”, 2.“Run this ONLY ONCE when the widget appears”, 3.“When this screen is shown for the first time,call controller.loadUsers() ONCE,and NEVER again.”
//     //   Future.microtask(() {
//     //     ref.read(userControllerProvider.notifier).loadUsers();
//     //   });
//     //   return;
//     // });
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: GestureDetector(
//             onTap: () {
//               Utils.infoSnackBar(
//                 context,
//                 'Your message has been sent successfully.',
//                 title: 'Well done!',
//               );
//             },
//             child: Text(
//               "User",
//               style: AppFonts.headingTextStyle.copyWith(color: AppColors.black),
//             ),
//           ),
//         ),
//         body: Center(
//           child: Consumer(
//             builder: (context, ref, widget) {
//               final state = ref.watch(userControllerProvider);
//               if (state.isLoading) {
//                 return const Center(
//                   child: CircularProgressIndicator(color: Colors.red),
//                 );
//               }

//               if ((state.users?.isEmpty ?? "") == "") {
//                 return Center(child: Text(state.message.toString()));
//               }

//               return RefreshIndicator(
//                 onRefresh: () async {
//                   ref.read(userControllerProvider.notifier).loadUsers();
//                 },
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: state.users?.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       leading: Image.network(state.users?[index].avatar ?? ""),
//                       title: Text(state.users?[index].firstName ?? ""),
//                       subtitle: Text(state.users?[index].email ?? ""),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final UserController userController;

  @override
  void initState() {
    userController = ref.read(userControllerProvider.notifier);

    // if you need to call every time whenever user hit this screen then this is ideal but if you want only once then call it in controller constructor Or use above exmaple
    Future.microtask(() {
      userController.loadUsers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    debugPrint("hello ");
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Utils.infoSnackBar(
              context,
              'Your message has been sent successfully.',
              title: 'Well done!',
            );
          },
          child: Text(
            "User",
            style: AppFonts.headingTextStyle.copyWith(color: AppColors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeMode.theme == AppThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, widget) {
            final state = ref.watch(userControllerProvider);
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            }

            if ((state.message ?? "").isNotEmpty) {
              if (state.message!.toLowerCase().contains("no internet")) {
                return Center(
                  child: InternetExceptionWidget(
                    message: state.message,
                    onRetry: () {
                      userController.loadUsers();
                    },
                  ),
                );
              } else {
                return Center(
                  child: GeneralExceptionWidget(
                    message: state.message,
                    onRetry: () {
                      userController.loadUsers();
                    },
                  ),
                );
              }
            }
            if ((state.users?.isEmpty ?? "") == "") {
              return Center(child: Text("No Data Found"));
            }

            return RefreshIndicator(
              onRefresh: () async {
                ref.read(userControllerProvider.notifier).loadUsers();
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.users?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(state.users?[index].avatar ?? ""),
                    title: Text(state.users?[index].firstName ?? ""),
                    subtitle: Text(state.users?[index].email ?? ""),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
