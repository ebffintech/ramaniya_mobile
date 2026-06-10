import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';
import 'package:ramaniya_mobile/screens/scheduling_screen.dart';
import 'package:ramaniya_mobile/widgets/page_header.dart';

class AdvisorScreen extends StatelessWidget {
  const AdvisorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softPageBg,
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.pageGradient),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                child: PageHeader(
                  kicker: 'STEP 1 · YOUR DETAILS',
                  title: 'Talk to a Ramaniya advisor',
                  subtitle:
                      'A SEBI-registered MFD will reach out — share a few details so we can match you.',
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _InfoBox(),
                      const SizedBox(height: 20),
                      const _AdvisorFormFields(),
                      const SizedBox(height: 28),
                      _GradientButton(
                        label: 'Continue to scheduling',
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (_) => const SchedulingScreen()),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Your details are shared only with the matched advisor.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.newsreader(
                          fontSize: 12,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Info box (dashed border) ──────────────────────────────────────────────────

class _InfoBox extends StatelessWidget {
  const _InfoBox();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(color: AppColors.borderMedium, radius: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.info_outline, size: 16, color: AppColors.gold),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Self-serve NRI investing is coming soon. For now, an advisor will help you set up NRE/NRO-linked SIPs and complete FATCA declarations on a 30-min call.',
                style: GoogleFonts.newsreader(
                  fontSize: 12,
                  height: 1.45,
                  color: AppColors.warmBrown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  const _DashedBorderPainter({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(radius),
      ));

    const dashWidth = 5.0;
    const dashSpace = 4.0;
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0, metric.length)),
          paint,
        );
        distance = next + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter old) =>
      old.color != color || old.radius != radius;
}

// ── Form fields ───────────────────────────────────────────────────────────────

class _AdvisorFormFields extends StatelessWidget {
  const _AdvisorFormFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel('Full name'),
        const SizedBox(height: 8),
        const _AdvisorTextField(),
        const SizedBox(height: 16),
        _FieldLabel('Email'),
        const SizedBox(height: 8),
        const _AdvisorTextField(keyboardType: TextInputType.emailAddress),
        const SizedBox(height: 16),
        _FieldLabel('Phone'),
        const SizedBox(height: 8),
        const _AdvisorTextField(keyboardType: TextInputType.phone),
        const SizedBox(height: 16),
        _FieldLabel('City'),
        const SizedBox(height: 8),
        const _AdvisorTextField(),
        const SizedBox(height: 16),
        _FieldLabel("What's your primary goal?"),
        const SizedBox(height: 8),
        const _AdvisorTextField(),
      ],
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryForest,
      ),
    );
  }
}

class _AdvisorTextField extends StatelessWidget {
  const _AdvisorTextField({this.keyboardType});

  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      style: GoogleFonts.newsreader(fontSize: 14, color: AppColors.ink),
      decoration: const InputDecoration(),
    );
  }
}

// ── Gradient button ───────────────────────────────────────────────────────────

class _GradientButton extends StatelessWidget {
  const _GradientButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          gradient: AppColors.primaryButtonGradient,
          borderRadius: BorderRadius.circular(999),
          boxShadow: AppColors.cardShadow,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: GoogleFonts.fraunces(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.creamWhite,
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward, size: 16, color: AppColors.creamWhite),
          ],
        ),
      ),
    );
  }
}
