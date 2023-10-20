import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppButtonStyles {
  static ElevatedButtonThemeData elevatedButtonThemeDataLight =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))));
}
