import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';
import 'package:ramaniya_mobile/screens/residency_check_screen.dart';
import 'package:ramaniya_mobile/widgets/auth_tab_switcher.dart';
import 'package:ramaniya_mobile/widgets/screen_back_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _openResidencyCheck() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => const ResidencyCheckScreen(),
      ),
    );
  }

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
              // Header row
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
                child: Row(
                  children: [
                    const ScreenBackButton(),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.gold.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                            color: AppColors.gold.withValues(alpha: 0.3)),
                      ),
                      child: Text(
                        'INVESTOR JOURNEY',
                        style: GoogleFonts.fraunces(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                          color: AppColors.gold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const _LoginHeader(),
                      const SizedBox(height: 24),
                      AuthTabSwitcher(
                        hasAccount: true,
                        onHaveAccountTap: () {},
                        onNewUserTap: _openResidencyCheck,
                      ),
                      const SizedBox(height: 24),
                      const _LoginFormFields(),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Forgot password?',
                            style: GoogleFonts.newsreader(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryForest,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _GradientButton(
                        label: 'Sign in & start investing',
                        onTap: () {},
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "We'll take you straight to your dashboard.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.newsreader(
                          fontSize: 12,
                          color: AppColors.muted,
                        ),
                      ),
                      const SizedBox(height: 28),
                      const _SocialLoginSection(),
                      const SizedBox(height: 28),
                      _LoginFooter(onSignUpTap: _openResidencyCheck),
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

// ── Login header ──────────────────────────────────────────────────────────────

class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primaryForest,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            'R',
            style: GoogleFonts.fraunces(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.creamWhite,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Welcome back',
          textAlign: TextAlign.center,
          style: GoogleFonts.fraunces(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryForest,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Sign in and pick up where you left off.',
          textAlign: TextAlign.center,
          style: GoogleFonts.newsreader(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: AppColors.warmBrown,
            height: 1.45,
          ),
        ),
      ],
    );
  }
}

// ── Form fields ───────────────────────────────────────────────────────────────

class _LoginFormFields extends StatefulWidget {
  const _LoginFormFields();

  @override
  State<_LoginFormFields> createState() => _LoginFormFieldsState();
}

class _LoginFormFieldsState extends State<_LoginFormFields> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel('Email or mobile'),
        const SizedBox(height: 8),
        _buildField(
          hint: 'rahul@example.com',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        _FieldLabel('Password'),
        const SizedBox(height: 8),
        _buildField(
          hint: '••••••••',
          obscure: _obscurePassword,
          suffix: IconButton(
            onPressed: () =>
                setState(() => _obscurePassword = !_obscurePassword),
            icon: Icon(
              _obscurePassword
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              size: 18,
              color: AppColors.muted,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildField({
    required String hint,
    TextInputType? keyboardType,
    bool obscure = false,
    Widget? suffix,
  }) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: obscure,
      style: GoogleFonts.newsreader(
        fontSize: 14,
        color: AppColors.ink,
      ),
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffix,
      ),
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
        fontWeight: FontWeight.w500,
        color: AppColors.muted,
      ),
    );
  }
}

// ── Gradient CTA button ───────────────────────────────────────────────────────

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
        child: Text(
          label,
          style: GoogleFonts.fraunces(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.creamWhite,
          ),
        ),
      ),
    );
  }
}

// ── Social login ──────────────────────────────────────────────────────────────

class _SocialLoginSection extends StatelessWidget {
  const _SocialLoginSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.borderMain, height: 1)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'or continue with',
                style: GoogleFonts.newsreader(
                  fontSize: 12,
                  color: AppColors.muted,
                ),
              ),
            ),
            Expanded(child: Divider(color: AppColors.borderMain, height: 1)),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: _SocialButton(
                icon: const _GoogleLogo(),
                label: 'Google',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _SocialButton(
                icon: Icon(Icons.apple, size: 20, color: AppColors.ink),
                label: 'Apple',
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Widget icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.creamWhite,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.creamWhite,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderMain),
          ),
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 8),
              Text(
                label,
                style: GoogleFonts.fraunces(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GoogleLogo extends StatelessWidget {
  const _GoogleLogo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 18,
      child: CustomPaint(painter: _GoogleLogoPainter()),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final blue   = Paint()..color = const Color(0xFF4285F4);
    final red    = Paint()..color = const Color(0xFFEA4335);
    final yellow = Paint()..color = const Color(0xFFFBBC05);
    final green  = Paint()..color = const Color(0xFF34A853);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -0.4, 2.2, true, blue);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),  1.8, 1.4, true, green);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),  3.2, 1.2, true, yellow);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),  4.4, 1.5, true, red);
    canvas.drawCircle(center, radius * 0.55, Paint()..color = Colors.white);
    canvas.drawRect(
      Rect.fromLTWH(center.dx, center.dy - radius * 0.15, radius, radius * 0.3),
      blue,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter _) => false;
}

// ── Footer ────────────────────────────────────────────────────────────────────

class _LoginFooter extends StatelessWidget {
  const _LoginFooter({required this.onSignUpTap});

  final VoidCallback onSignUpTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.newsreader(fontSize: 13, color: AppColors.muted),
        children: [
          const TextSpan(text: "Don't have an account? "),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: GestureDetector(
              onTap: onSignUpTap,
              child: Text(
                'Sign Up',
                style: GoogleFonts.fraunces(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryForest,
                ),
              ),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
