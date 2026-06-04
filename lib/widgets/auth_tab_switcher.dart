import 'package:flutter/material.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';

class AuthTabSwitcher extends StatelessWidget {
  const AuthTabSwitcher({
    super.key,
    required this.hasAccount,
    required this.onHaveAccountTap,
    required this.onNewUserTap,
  });

  final bool hasAccount;
  final VoidCallback onHaveAccountTap;
  final VoidCallback onNewUserTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.lightMintGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: _AuthTab(
              label: 'I have an account',
              isActive: hasAccount,
              onTap: onHaveAccountTap,
            ),
          ),
          Expanded(
            child: _AuthTab(
              label: 'I\u2019m new here',
              isActive: !hasAccount,
              onTap: onNewUserTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthTab extends StatelessWidget {
  const _AuthTab({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          decoration: BoxDecoration(
            color: isActive ? AppColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              color: isActive ? AppColors.headingDark : AppColors.bodyGray,
            ),
          ),
        ),
      ),
    );
  }
}
