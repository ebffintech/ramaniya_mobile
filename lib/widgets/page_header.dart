import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';

/// Compact editorial header used across all app screens.
///
/// Layout:
///   [gold kicker]
///   [forest title]          [← back button]
///   [warm italic subtitle]
///   ── soft divider ──
class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.title,
    this.kicker,
    this.subtitle,
    this.showBack = true,
  });

  final String title;
  final String? kicker;
  final String? subtitle;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (kicker != null) ...[
                    Text(
                      kicker!.toUpperCase(),
                      style: GoogleFonts.fraunces(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                        color: AppColors.gold,
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                  Text(
                    title,
                    style: GoogleFonts.fraunces(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryForest,
                      height: 1.2,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: GoogleFonts.newsreader(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: AppColors.warmBrown,
                        height: 1.45,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (showBack) ...[
              const SizedBox(width: 12),
              const _BackCircleButton(),
            ],
          ],
        ),
        const SizedBox(height: 14),
        Divider(color: AppColors.borderSoft, height: 1),
      ],
    );
  }
}

class _BackCircleButton extends StatelessWidget {
  const _BackCircleButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.warmCard,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () => Navigator.of(context).maybePop(),
        customBorder: const CircleBorder(),
        child: Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.borderMain),
          ),
          child: Icon(
            Icons.arrow_back,
            size: 18,
            color: AppColors.primaryForest,
          ),
        ),
      ),
    );
  }
}
