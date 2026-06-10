import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';
import 'package:ramaniya_mobile/screens/advisor_screen.dart';
import 'package:ramaniya_mobile/screens/login_screen.dart';
import 'package:ramaniya_mobile/widgets/auth_tab_switcher.dart';
import 'package:ramaniya_mobile/widgets/page_header.dart';

class ResidencyCheckScreen extends StatelessWidget {
  const ResidencyCheckScreen({super.key});

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
                child: AuthTabSwitcher(
                  hasAccount: false,
                  onHaveAccountTap: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                            builder: (_) => const LoginScreen()),
                      );
                    }
                  },
                  onNewUserTap: () {},
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PageHeader(
                        kicker: 'FIRST, A QUICK CHECK',
                        title: 'Where do you reside?',
                        subtitle:
                            'Investment rules, KYC, and tax treatment differ — we tailor your next steps.',
                      ),
                      const SizedBox(height: 20),
                      _ResidencyOptionCard(
                        icon: Icons.location_on_outlined,
                        title: 'Resident Indian',
                        subtitle:
                            'Self-invest in mutual funds with PAN + Aadhaar KYC.',
                        onTap: () {},
                      ),
                      const SizedBox(height: 10),
                      _ResidencyOptionCard(
                        icon: Icons.flight_outlined,
                        title: 'NRI / OCI',
                        subtitle:
                            'Guided by an advisor — NRE/NRO, FATCA & repatriation handled for you.',
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (_) => const AdvisorScreen()),
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
      color: AppColors.warmCard,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.warmCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMain),
            boxShadow: AppColors.cardShadow,
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
                  color: AppColors.primaryForest.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    Icon(icon, size: 20, color: AppColors.primaryForest),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.fraunces(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryForest,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.newsreader(
                        fontSize: 12,
                        height: 1.4,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.chevron_right, size: 20, color: AppColors.muted),
            ],
          ),
        ),
      ),
    );
  }
}
