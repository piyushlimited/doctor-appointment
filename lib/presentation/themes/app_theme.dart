import 'package:flutter/material.dart';

import 'app_button_styles.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.blue)),
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.primary,
      iconTheme: const IconThemeData(color: AppColors.blue),
      textTheme: const TextTheme().copyWith(
          headlineSmall:
              const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          bodyLarge:
              const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
      elevatedButtonTheme: AppButtonStyles.elevatedButtonThemeDataLight,
      radioTheme: const RadioThemeData(
          fillColor: MaterialStatePropertyAll(Colors.blue)),
      dividerColor: AppColors.black,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColors.blue),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: Colors.black));
}
