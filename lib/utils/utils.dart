import 'package:doctor_appointment/presentation/themes/app_colors.dart';
import 'package:doctor_appointment/presentation/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void showSnackBar({required String title, required String message}) {
    Get.snackbar(title, message);
  }

  static void showLoadingDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.2),
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 0),
        pageBuilder: (context, animation, secondaryAnimation) =>
            SizedBox.expand(
              // makes widget fullscreen
              child: Center(
                child: Card(
                    color: AppColors.blue.withOpacity(.9),
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const CircularProgressIndicator(
                        strokeWidth: 4,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.white),
                      ),
                    )),
              ),
            ));
  }

  static void dismissLoadingDialog() {
    Get.back();
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
