import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';

abstract final class AppTheme {
  static final ThemeData light = _buildLightTheme();

  static ThemeData _buildLightTheme() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryDarkGreen,
        secondary: AppColors.primaryMediumGreen,
        surface: AppColors.white,
      ),
    );

    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: AppColors.bodyGray,
        displayColor: AppColors.headingDark,
      ),
    );
  }
}
