import 'package:flutter/material.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _LogoBadge(),
              const SizedBox(height: 28),
              const _HeroSection(),
              const SizedBox(height: 28),
              const _FeatureCards(),
              const SizedBox(height: 32),
              const _StartingPointSection(),
              const SizedBox(height: 20),
              const _InvestorCard(),
              const SizedBox(height: 28),
              const _FooterDisclaimer(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoBadge extends StatelessWidget {
  const _LogoBadge();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.lightMintGreen,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.auto_awesome,
              size: 16,
              color: AppColors.primaryDarkGreen,
            ),
            const SizedBox(width: 6),
            Text(
              'RAMANIYA',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
                color: AppColors.primaryDarkGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 24,
              height: 1.2,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
            children: [
              TextSpan(
                text: 'India\u2019s mutual fund platform,\n',
                style: TextStyle(color: AppColors.headingDark),
              ),
              TextSpan(
                text: 'built around how you actually invest.',
                style: TextStyle(color: AppColors.primaryMediumGreen),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Whether you invest with \u20B9500 SIPs or run a full desk of distributors, Ramaniya keeps onboarding, KYC, and post-investment hygiene in one clean flow.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            height: 1.55,
            color: AppColors.bodyGray,
          ),
        ),
      ],
    );
  }
}

class _FeatureCards extends StatelessWidget {
  const _FeatureCards();

  static const _cards = [
    _FeatureCardData(
      icon: Icons.verified_user_outlined,
      title: 'SEBI-aligned',
      subtitle: 'KYC & nominee',
    ),
    _FeatureCardData(
      icon: Icons.trending_up,
      title: '1,200+ funds',
      subtitle: 'AMFI data',
    ),
    _FeatureCardData(
      icon: Icons.groups_outlined,
      title: 'Distributor desk',
      subtitle: 'AI-prepared',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < _cards.length; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          Expanded(child: _FeatureCard(data: _cards[i])),
        ],
      ],
    );
  }
}

class _FeatureCardData {
  const _FeatureCardData({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({required this.data});

  final _FeatureCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.lightMintGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              data.icon,
              size: 18,
              color: AppColors.primaryDarkGreen,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              height: 1.25,
              color: AppColors.headingDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            data.subtitle,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 9,
              height: 1.25,
              color: AppColors.bodyGray,
            ),
          ),
        ],
      ),
    );
  }
}

class _StartingPointSection extends StatelessWidget {
  const _StartingPointSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PICK YOUR STARTING POINT',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
            color: AppColors.bodyGray,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'You can switch any time \u2014 your data stays with you.',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 10,
            color: AppColors.bodyGray,
          ),
        ),
      ],
    );
  }
}

class _InvestorCard extends StatelessWidget {
  const _InvestorCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.investorCardGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryMediumGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.person_outline,
                  color: AppColors.white,
                  size: 22,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white.withValues(alpha: 0.5)),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'FOR INVESTORS',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'I want to start investing',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Invest on your own with guided prep \u2192 KYC \u2192 SIP or lumpsum in about 5 minutes.',
            style: TextStyle(
              fontSize: 12,
              height: 1.45,
              color: AppColors.investorMutedText,
            ),
          ),
          const SizedBox(height: 20),
          _InvestorCtaButton(
            isPrimary: true,
            icon: Icons.rocket_launch_outlined,
            title: 'Start as investor',
            badge: 'RECOMMENDED',
            subtitle: '3 prep questions \u2192 KYC \u2192 SIP / lumpsum in ~5 min',
            onTap: () {},
          ),
          const SizedBox(height: 12),
          _InvestorCtaButton(
            isPrimary: false,
            icon: Icons.phone_outlined,
            title: 'Call an advisor',
            subtitle: 'Share basics \u2192 30-min discovery call \u2192 plan in 48 hrs',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _InvestorCtaButton extends StatelessWidget {
  const _InvestorCtaButton({
    required this.isPrimary,
    required this.icon,
    required this.title,
    this.badge,
    required this.subtitle,
    required this.onTap,
  });

  final bool isPrimary;
  final IconData icon;
  final String title;
  final String? badge;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isPrimary ? AppColors.white : Colors.transparent,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Ink(
          decoration: BoxDecoration(
            color: isPrimary ? AppColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
            border: isPrimary
                ? null
                : Border.all(color: AppColors.investorCardBorder),
          ),
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isPrimary
                      ? AppColors.lightMintGreen
                      : AppColors.primaryDarkGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  size: 22,
                  color: isPrimary
                      ? AppColors.primaryDarkGreen
                      : AppColors.white,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: isPrimary
                                  ? AppColors.headingDark
                                  : AppColors.white,
                            ),
                          ),
                        ),
                        if (badge != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.lightMintGreen,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              badge!,
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: AppColors.primaryDarkGreen,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 10,
                        height: 1.35,
                        color: isPrimary
                            ? AppColors.bodyGray
                            : AppColors.investorMutedText,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: isPrimary
                    ? AppColors.primaryDarkGreen
                    : AppColors.investorMutedText,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterDisclaimer extends StatelessWidget {
  const _FooterDisclaimer();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Ramaniya doesn\u2019t hold your money. SIPs and redemptions move directly between your bank and the AMC, regulated by SEBI.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 10,
        height: 1.5,
        color: AppColors.bodyGray,
      ),
    );
  }
}
