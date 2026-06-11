import 'package:flutter/material.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';

class ScreenBackButton extends StatelessWidget {
  const ScreenBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.lightMintGreen,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () => Navigator.of(context).maybePop(),
        customBorder: const CircleBorder(),
        child: const SizedBox(
          width: 40,
          height: 40,
          child: Icon(
            Icons.arrow_back,
            size: 20,
            color: AppColors.headingDark,
          ),
        ),
      ),
    );
  }
}
