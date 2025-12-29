import 'package:flutter/material.dart';
import 'package:mvvm_with_riverpod_dio/core/enums/snackbar_enum.dart';
import 'package:mvvm_with_riverpod_dio/utils/snackbar/custom_snackbar.dart';

class Utils {
  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static succesSnackBar(BuildContext context, String message, {String? title}) {
    showAwesomeSnackbar(
      context,
      title ?? 'Success',
      message,
      AwesomeSnackbarType.success,
    );
  }

  static errorSnackBar(BuildContext context, String message, {String? title}) {
    showAwesomeSnackbar(
      context,
      title ?? 'Error',
      message,
      AwesomeSnackbarType.error,
    );
  }

  static infoSnackBar(BuildContext context, String message, {String? title}) {
    showAwesomeSnackbar(
      context,
      title ?? 'Hi there!',
      message,
      AwesomeSnackbarType.info,
    );
  }

  static warningSnackBar(
    BuildContext context,
    String message, {
    String? title,
  }) {
    showAwesomeSnackbar(
      context,
      title ?? 'Warning!',
      message,
      AwesomeSnackbarType.warning,
    );
  }
}
