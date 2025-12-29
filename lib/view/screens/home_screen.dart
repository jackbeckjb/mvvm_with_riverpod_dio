import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mvvm_with_riverpod_dio/core/providers/providers.dart';
import 'package:mvvm_with_riverpod_dio/res/colors/app_colors.dart';
import 'package:mvvm_with_riverpod_dio/res/fonts/app_fonts.dart';
import 'package:mvvm_with_riverpod_dio/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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

              if ((state.users?.isEmpty ?? "") == "") {
                return Center(child: Text(state.message.toString()));
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.users?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(state.users?[index].avatar ?? ""),
                    title: Text(state.users?[index].firstName ?? ""),
                    subtitle: Text(state.users?[index].email ?? ""),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
