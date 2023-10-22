import 'package:doctor_appointment/presentation/themes/app_colors.dart';
import 'package:doctor_appointment/presentation/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void showSnackBar({required String title, required String message}) {
    Get.snackbar(title, message);
  }

  static PreferredSize appBar({String? title, List<Widget>? actions}) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBarWidget(
          title: title,
          actions: actions,
        ));
  }
}
