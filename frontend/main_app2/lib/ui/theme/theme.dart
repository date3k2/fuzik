import 'package:flutter/material.dart';

import 'color.dart';

abstract class AppThemes {
  static ThemeData nightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: AppColors.purple,
        background: AppColors.night,
        onSurfaceVariant: AppColors.grey,
        onPrimary: AppColors.yellow
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle: TextStyle(color: AppColors.yellow),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.purple, width: 3)
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 3)
      )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      )
    ),
    checkboxTheme: const CheckboxThemeData(
      checkColor: MaterialStatePropertyAll(AppColors.night)
    )
  );
}