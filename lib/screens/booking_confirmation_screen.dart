import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';
import 'package:ramaniya_mobile/screens/login_screen.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({
    super.key,
    this.email = 'sam.kumar@example.com',
  });

  final String email;

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
              // Gold top accent rule
              Container(
                height: 2,
                decoration: BoxDecoration(
                  gradient: AppColors.goldAccentRule(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.primaryForest.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: AppColors.borderMain),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle_outline,
                            size: 13, color: AppColors.primaryForest),
                        const SizedBox(width: 6),
                        Text(
                          'CONFIRMED',
                          style: GoogleFonts.fraunces(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                            color: AppColors.primaryForest,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 32),
                  child: Column(
                    children: [
                      // Check circle
                      Container(
                        width: 72,
                        height: 72,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primaryForest.withValues(alpha: 0.08),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryButtonGradient,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.check,
                              color: AppColors.creamWhite, size: 26),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'You\'re booked in',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.fraunces(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.4,
                          color: AppColors.primaryForest,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          style: GoogleFonts.newsreader(
                            fontSize: 14,
                            height: 1.5,
                            color: AppColors.muted,
                          ),
                          children: [
                            const TextSpan(
                                text: 'A confirmation has been emailed to '),
                            TextSpan(
                              text: email,
                              style: GoogleFonts.newsreader(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.ink,
                              ),
                            ),
                            const TextSpan(
                                text: '. Your advisor will join the call on time.'),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 28),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: AppColors.warmCard,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.borderMain),
                          boxShadow: AppColors.cardShadow,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'WHAT HAPPENS NEXT',
                              style: GoogleFonts.fraunces(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8,
                                color: AppColors.gold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _NextStepRow(
                              icon: Icons.event_available_outlined,
                              label: 'Calendar invite with video link sent to your email.',
                            ),
                            Divider(
                                color: AppColors.borderSoft,
                                height: 20),
                            _NextStepRow(
                              icon: Icons.verified_outlined,
                              label: 'Pre-call brief shared with your matched advisor.',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute<void>(
                        builder: (_) => const LoginScreen()),
                    (route) => false,
                  ),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryButtonGradient,
                      borderRadius: BorderRadius.circular(999),
                      boxShadow: AppColors.cardShadow,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Explore the app meanwhile',
                      style: GoogleFonts.fraunces(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.creamWhite,
                      ),
                    ),
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

class _NextStepRow extends StatelessWidget {
  const _NextStepRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: AppColors.primaryForest),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.newsreader(
              fontSize: 13,
              height: 1.4,
              color: AppColors.ink,
            ),
          ),
        ),
      ],
    );
  }
}
