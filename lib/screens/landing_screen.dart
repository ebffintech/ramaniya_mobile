import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';
import 'package:ramaniya_mobile/screens/advisor_screen.dart';
import 'package:ramaniya_mobile/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softPageBg,
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.pageGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _Wordmark(),
                const SizedBox(height: 24),
                const _HeroSection(),
                const SizedBox(height: 20),
                const _PhilosophyCards(),
                const SizedBox(height: 24),
                const _RouteSection(),
                const SizedBox(height: 20),
                const _PlatformBenefits(),
                const SizedBox(height: 24),
                const _FooterDisclaimer(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Wordmark ──────────────────────────────────────────────────────────────────

class _Wordmark extends StatelessWidget {
  const _Wordmark();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.warmCard,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.borderMain),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: AppColors.primaryForest,
                  borderRadius: BorderRadius.circular(4),
                ),
                alignment: Alignment.center,
                child: Text(
                  'R',
                  style: GoogleFonts.fraunces(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.creamWhite,
                  ),
                ),
              ),
              const SizedBox(width: 7),
              Text(
                'Ramaniya',
                style: GoogleFonts.fraunces(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                  color: AppColors.primaryForest,
                ),
              ),
            ],
          ),
        ),
        // Gold kicker tag
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.gold.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: AppColors.gold.withValues(alpha: 0.3)),
          ),
          child: Text(
            'SEBI · AMFI',
            style: GoogleFonts.fraunces(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.9,
              color: AppColors.gold,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Hero ──────────────────────────────────────────────────────────────────────

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Wealth evolved.',
          style: GoogleFonts.fraunces(
            fontSize: 38,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryForest,
            height: 1.1,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "India's mutual fund platform,\nbuilt around how you actually invest.",
          style: GoogleFonts.newsreader(
            fontSize: 15,
            fontStyle: FontStyle.italic,
            color: AppColors.warmBrown,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Drive your own SIPs, get matched with a SEBI-registered distributor, or run a calmer, connected mutual fund workspace that keeps discovery, KYC, and portfolio flows in one place.',
          style: GoogleFonts.newsreader(
            fontSize: 13,
            height: 1.55,
            color: AppColors.ink.withValues(alpha: 0.72),
          ),
        ),
      ],
    );
  }
}

// ── Philosophy cards (top 3 — "what Ramaniya is") ────────────────────────────

class _PhilosophyCards extends StatelessWidget {
  const _PhilosophyCards();

  static const _items = [
    _CardData(
      icon: Icons.account_balance_outlined,
      title: 'Mutual fund first',
      body: 'Clear entry into SIP, lumpsum, KYC, and review.',
    ),
    _CardData(
      icon: Icons.tune_outlined,
      title: 'Built for modern investors',
      body: 'Simple flows for self-serve and guided investing.',
    ),
    _CardData(
      icon: Icons.hub_outlined,
      title: 'One intelligence layer',
      body: 'Investor, advisor, and distributor journeys connected.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section rule
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  gradient: AppColors.goldAccentRule(opacity: 0.5),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < _items.length; i++) ...[
              if (i > 0) const SizedBox(width: 8),
              Expanded(child: _PhilosophyCard(data: _items[i])),
            ],
          ],
        ),
      ],
    );
  }
}

class _CardData {
  const _CardData({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final String body;
}

class _PhilosophyCard extends StatelessWidget {
  const _PhilosophyCard({required this.data});

  final _CardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.warmCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMain),
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryForest.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(data.icon, size: 16, color: AppColors.primaryForest),
          ),
          const SizedBox(height: 10),
          Text(
            data.title,
            style: GoogleFonts.fraunces(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryForest,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data.body,
            style: GoogleFonts.newsreader(
              fontSize: 10,
              height: 1.4,
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Route selection ───────────────────────────────────────────────────────────

class _RouteSection extends StatelessWidget {
  const _RouteSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CHOOSE YOUR ROUTE',
          style: GoogleFonts.fraunces(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            color: AppColors.gold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Pick a path — you can switch any time.',
          style: GoogleFonts.newsreader(
            fontSize: 13,
            fontStyle: FontStyle.italic,
            color: AppColors.warmBrown,
          ),
        ),
        const SizedBox(height: 14),
        _RouteCard(
          isPrimary: true,
          icon: Icons.rocket_launch_outlined,
          kicker: 'FOR INVESTORS',
          title: 'Start as an investor',
          subtitle:
              '3 prep questions → KYC → SIP or lumpsum in about 5 minutes.',
          badge: 'RECOMMENDED',
          ctaLabel: 'Get started',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const LoginScreen()),
          ),
        ),
        const SizedBox(height: 10),
        _RouteCard(
          isPrimary: false,
          icon: Icons.phone_outlined,
          kicker: 'GUIDED',
          title: 'Call an advisor',
          subtitle:
              'Share basics → 30-min discovery call → personalised plan in 48 hrs.',
          ctaLabel: 'Book a call',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const AdvisorScreen()),
          ),
        ),
      ],
    );
  }
}

class _RouteCard extends StatelessWidget {
  const _RouteCard({
    required this.isPrimary,
    required this.icon,
    required this.kicker,
    required this.title,
    required this.subtitle,
    required this.ctaLabel,
    required this.onTap,
    this.badge,
  });

  final bool isPrimary;
  final IconData icon;
  final String kicker;
  final String title;
  final String subtitle;
  final String ctaLabel;
  final VoidCallback onTap;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final bg = isPrimary ? AppColors.primaryForest : AppColors.warmCard;
    final textMain = isPrimary ? AppColors.creamWhite : AppColors.primaryForest;
    final textSub = isPrimary
        ? AppColors.creamWhite.withValues(alpha: 0.72)
        : AppColors.muted;
    final kickerColor = isPrimary
        ? AppColors.creamWhite.withValues(alpha: 0.55)
        : AppColors.gold;
    final borderColor = isPrimary ? Colors.transparent : AppColors.borderMain;

    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: borderColor),
            boxShadow: isPrimary ? AppColors.cardShadow : null,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isPrimary
                          ? AppColors.creamWhite.withValues(alpha: 0.12)
                          : AppColors.primaryForest.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, size: 20, color: textMain),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isPrimary
                          ? AppColors.creamWhite.withValues(alpha: 0.1)
                          : AppColors.gold.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: isPrimary
                            ? AppColors.creamWhite.withValues(alpha: 0.2)
                            : AppColors.gold.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      kicker,
                      style: GoogleFonts.fraunces(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                        color: kickerColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: GoogleFonts.fraunces(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: textMain,
                        height: 1.2,
                      ),
                    ),
                  ),
                  if (badge != null) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.gold.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        badge!,
                        style: GoogleFonts.fraunces(
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                          color: AppColors.gold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: GoogleFonts.newsreader(
                  fontSize: 12,
                  height: 1.45,
                  color: textSub,
                ),
              ),
              const SizedBox(height: 16),
              // CTA button
              Container(
                height: 42,
                decoration: BoxDecoration(
                  gradient: isPrimary
                      ? null
                      : AppColors.primaryButtonGradient,
                  color: isPrimary
                      ? AppColors.creamWhite
                      : null,
                  borderRadius: BorderRadius.circular(999),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      ctaLabel,
                      style: GoogleFonts.fraunces(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: isPrimary
                            ? AppColors.primaryForest
                            : AppColors.creamWhite,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      Icons.arrow_forward,
                      size: 14,
                      color: isPrimary
                          ? AppColors.primaryForest
                          : AppColors.creamWhite,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Platform benefits (3 tags) ────────────────────────────────────────────────

class _PlatformBenefits extends StatelessWidget {
  const _PlatformBenefits();

  static const _items = [
    _BenefitData(icon: Icons.verified_outlined,    label: 'SEBI-aligned',    sub: 'KYC & nominee'),
    _BenefitData(icon: Icons.trending_up,           label: '1,200+ funds',    sub: 'AMFI data'),
    _BenefitData(icon: Icons.groups_2_outlined,     label: 'Distributor desk', sub: 'AI-prepared'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < _items.length; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          Expanded(child: _BenefitChip(data: _items[i])),
        ],
      ],
    );
  }
}

class _BenefitData {
  const _BenefitData({
    required this.icon,
    required this.label,
    required this.sub,
  });

  final IconData icon;
  final String label;
  final String sub;
}

class _BenefitChip extends StatelessWidget {
  const _BenefitChip({required this.data});

  final _BenefitData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.creamWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderMain),
      ),
      child: Column(
        children: [
          Icon(data.icon, size: 18, color: AppColors.primaryForest),
          const SizedBox(height: 8),
          Text(
            data.label,
            textAlign: TextAlign.center,
            style: GoogleFonts.fraunces(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryForest,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            data.sub,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 9,
              color: AppColors.muted,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Footer ────────────────────────────────────────────────────────────────────

class _FooterDisclaimer extends StatelessWidget {
  const _FooterDisclaimer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: AppColors.borderSoft, height: 1),
        const SizedBox(height: 12),
        Text(
          '© 2026 Ramaniya Technologies. All rights reserved.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "Ramaniya doesn't hold your money. SIPs and redemptions move directly between your bank and the AMC, regulated by SEBI. Mutual fund investments are subject to market risks.",
          textAlign: TextAlign.center,
          style: GoogleFonts.newsreader(
            fontSize: 11,
            height: 1.5,
            color: AppColors.ink.withValues(alpha: 0.45),
          ),
        ),
      ],
    );
  }
}
