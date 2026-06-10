import 'package:flutter/material.dart';

/// Ramaniya design system — cream / forest / gold editorial palette.
abstract final class AppColors {
  // ── Forest greens ─────────────────────────────────────────────
  static const Color primaryForest   = Color(0xFF123E2C);
  static const Color secondaryForest = Color(0xFF1C5A40);

  // ── Gold accent ───────────────────────────────────────────────
  static const Color gold = Color(0xFFB1832F);

  // ── Text ──────────────────────────────────────────────────────
  static const Color ink       = Color(0xFF1D1B15);
  static const Color warmBrown = Color(0xFF875A3F);
  static const Color muted     = Color(0xFF6D6456);

  // ── Backgrounds / surfaces ────────────────────────────────────
  static const Color landingPaper   = Color(0xFFEDE3CF);
  static const Color strongPaper    = Color(0xFFF5EEE2);
  static const Color softPageBg     = Color(0xFFF4EEE2);
  static const Color creamWhite     = Color(0xFFFFFAF1);
  static const Color warmCard       = Color(0xFFF9F3E9);
  static const Color workspacePanel = Color(0xFFFAF5EB);
  static const Color headerSurface  = Color(0xFFFCF8F0);

  // ── Borders (rgba — cannot be const) ─────────────────────────
  static Color get borderSoft   => primaryForest.withValues(alpha: 0.08);
  static Color get borderMain   => primaryForest.withValues(alpha: 0.12);
  static Color get borderMedium => primaryForest.withValues(alpha: 0.14);
  static Color get borderStrong => primaryForest.withValues(alpha: 0.16);

  // ── Shadows ───────────────────────────────────────────────────
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: primaryForest.withValues(alpha: 0.17),
      blurRadius: 36,
      offset: const Offset(0, 20),
      spreadRadius: -34,
    ),
  ];

  static List<BoxShadow> get headerShadow => [
    BoxShadow(
      color: primaryForest.withValues(alpha: 0.28),
      blurRadius: 44,
      offset: const Offset(0, 24),
      spreadRadius: -38,
    ),
  ];

  // ── Page gradient ─────────────────────────────────────────────
  static const Gradient pageGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [softPageBg, landingPaper],
  );

  // ── Button gradient ───────────────────────────────────────────
  static const Gradient primaryButtonGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [secondaryForest, primaryForest],
  );

  // ── Gold top accent rule gradient ─────────────────────────────
  static LinearGradient goldAccentRule({double opacity = 1.0}) =>
      LinearGradient(
        colors: [
          gold.withValues(alpha: 0.96 * opacity),
          primaryForest.withValues(alpha: 0.90 * opacity),
        ],
      );
}
