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
  );
}