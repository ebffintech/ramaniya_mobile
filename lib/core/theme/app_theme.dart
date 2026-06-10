import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract final class AppTheme {
  static final ThemeData light = _build();

  static ThemeData _build() {
    const scheme = ColorScheme.light(
      primary: AppColors.primaryForest,
      secondary: AppColors.secondaryForest,
      surface: AppColors.warmCard,
      tertiary: AppColors.gold,
      onPrimary: AppColors.creamWhite,
      onSecondary: AppColors.creamWhite,
      onSurface: AppColors.ink,
    );

    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.softPageBg,
      colorScheme: scheme,
    );

    // Inter is the base shell font; Fraunces/Newsreader applied per role.
    final interBase = GoogleFonts.interTextTheme(base.textTheme);

    final textTheme = interBase.copyWith(
      // ── Display (big landing wordmark / hero) → Fraunces ──────
      displayLarge: GoogleFonts.fraunces(
        fontSize: 52,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryForest,
        height: 1.1,
      ),
      displayMedium: GoogleFonts.fraunces(
        fontSize: 38,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryForest,
        height: 1.15,
      ),
      displaySmall: GoogleFonts.fraunces(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryForest,
        height: 1.2,
      ),

      // ── Headlines (section titles) → Fraunces ─────────────────
      headlineLarge: GoogleFonts.fraunces(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryForest,
        height: 1.25,
      ),
      headlineMedium: GoogleFonts.fraunces(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryForest,
        height: 1.3,
      ),
      headlineSmall: GoogleFonts.fraunces(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryForest,
        height: 1.3,
      ),

      // ── Titles (card titles, nav labels) → Fraunces ───────────
      titleLarge: GoogleFonts.fraunces(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryForest,
      ),
      titleMedium: GoogleFonts.fraunces(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryForest,
      ),
      titleSmall: GoogleFonts.fraunces(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryForest,
      ),

      // ── Body (descriptions, copy, helper text) → Newsreader ───
      bodyLarge: GoogleFonts.newsreader(
        fontSize: 15,
        height: 1.55,
        color: AppColors.ink,
      ),
      bodyMedium: GoogleFonts.newsreader(
        fontSize: 14,
        height: 1.5,
        color: AppColors.ink,
      ),
      bodySmall: GoogleFonts.newsreader(
        fontSize: 13,
        height: 1.45,
        color: AppColors.muted,
      ),

      // ── Labels (utility text, metadata) → Inter ───────────────
      labelLarge: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.ink,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.muted,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
        color: AppColors.muted,
      ),
    );

    return base.copyWith(
      textTheme: textTheme,
      // Remove elevation and tint from ElevatedButton so gradient shows
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.creamWhite,
          padding: EdgeInsets.zero,
          shape: const StadiumBorder(),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.creamWhite,
        hintStyle: GoogleFonts.newsreader(
          fontSize: 14,
          color: const Color(0xFF8B7F6D),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.borderMain),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.borderMain),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.primaryForest.withValues(alpha: 0.4),
            width: 1.5,
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.borderSoft,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
