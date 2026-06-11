import 'package:flutter/material.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';
import 'package:ramaniya_mobile/screens/scheduling_screen.dart';
import 'package:ramaniya_mobile/widgets/screen_back_button.dart';

class AdvisorScreen extends StatelessWidget {
  const AdvisorScreen({super.key});

  static const _screenBackground = Color(0xFFF7FBF8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _screenBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: ScreenBackButton(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightMintGreen,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: AppColors.mintAccent,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.verified_user_outlined,
                          size: 14,
                          color: AppColors.primaryDarkGreen,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'STEP 1 \u00B7 YOUR DETAILS',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.6,
                            color: AppColors.primaryDarkGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Talk to a Ramaniya advisor',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        letterSpacing: -0.4,
                        color: AppColors.headingDark,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'A SEBI-registered MFD will reach out. Share a few details so we can match you with the right advisor.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: AppColors.bodyGray,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const _InfoBox(),
                    const SizedBox(height: 24),
                    const _AdvisorFormFields(),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) =>
                                  const SchedulingScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryDarkGreen,
                          foregroundColor: AppColors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Continue to scheduling',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, size: 18),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Your details are shared only with the matched advisor.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.bodyGray,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  const _InfoBox();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedBorderPainter(
        color: AppColors.borderGray,
        radius: 12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.info_outline,
              size: 18,
              color: AppColors.bodyGray,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Self-serve NRI investing is coming soon. For now, an advisor will help you set up NRE/NRO-linked SIPs and complete FATCA declarations on a 30-min call.',
                style: TextStyle(
                  fontSize: 12,
                  height: 1.45,
                  color: AppColors.bodyGray,
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
  _DashedBorderPainter({
    required this.color,
    required this.radius,
  });

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
      );

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
  bool shouldRepaint(covariant _DashedBorderPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.radius != radius;
}

class _AdvisorFormFields extends StatelessWidget {
  const _AdvisorFormFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _FieldLabel('Full name'),
        const SizedBox(height: 8),
        const _AdvisorTextField(),
        const SizedBox(height: 18),
        const _FieldLabel('Email'),
        const SizedBox(height: 8),
        const _AdvisorTextField(
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 18),
        const _FieldLabel('Phone'),
        const SizedBox(height: 8),
        const _AdvisorTextField(
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 18),
        const _FieldLabel('City'),
        const SizedBox(height: 8),
        const _AdvisorTextField(),
        const SizedBox(height: 18),
        const _FieldLabel('What\u2019s your primary goal?'),
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
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppColors.headingDark,
      ),
    );
  }
}

class _AdvisorTextField extends StatelessWidget {
  const _AdvisorTextField({this.keyboardType});

  final TextInputType? keyboardType;

  static const _inputFill = Color(0xFFEEF6F1);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: _inputFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.primaryMediumGreen.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }
}
