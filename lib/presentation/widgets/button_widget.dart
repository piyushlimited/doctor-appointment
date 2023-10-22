import 'package:doctor_appointment/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget {
  static Widget elevatedButton(
      {required BuildContext context,
      required Function() onPress,
      required dynamic child,
      Alignment alignment = Alignment.center,
      Color backgroundColor = AppColors.blue,
      Color foregroundColor = AppColors.white}) {
    return Align(
      alignment: alignment,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            minimumSize: Size(MediaQuery.of(context).size.width / 1.2, 45)),
        child: child,
      ),
    );
  }
}
