import 'package:flutter/material.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';
import 'package:ramaniya_mobile/screens/advisor_screen.dart';
import 'package:ramaniya_mobile/widgets/screen_back_button.dart';

class ResidencyCheckScreen extends StatelessWidget {
  const ResidencyCheckScreen({super.key});

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
                      border: Border.all(color: AppColors.mintAccent),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          size: 14,
                          color: AppColors.primaryDarkGreen,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'FIRST, A QUICK CHECK',
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
                      'Where do you currently reside?',
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
                      'Investment rules, KYC and tax treatment differ for Resident Indians and NRIs \u2014 so we tailor the next steps for you.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: AppColors.bodyGray,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _ResidencyOptionCard(
                      icon: Icons.location_on_outlined,
                      title: 'Resident Indian',
                      subtitle:
                          'Self-invest in mutual funds with PAN + Aadhaar KYC',
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),
                    _ResidencyOptionCard(
                      icon: Icons.flight_outlined,
                      title: 'NRI / OCI',
                      subtitle:
                          'Guided by an advisor \u2014 NRE/NRO, FATCA & repatriation handled for you',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const AdvisorScreen(),
                          ),
                        );
                      },
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

class _ResidencyOptionCard extends StatelessWidget {
  const _ResidencyOptionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.cardBorder),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.lightMintGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  size: 22,
                  color: AppColors.primaryDarkGreen,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.headingDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.4,
                        color: AppColors.bodyGray,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 22,
                color: AppColors.bodyGray,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
