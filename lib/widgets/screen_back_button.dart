import 'package:flutter/material.dart';
import 'package:ramaniya_mobile/core/theme/app_colors.dart';

class ScreenBackButton extends StatelessWidget {
  const ScreenBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.warmCard,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: () => Navigator.of(context).maybePop(),
        customBorder: const CircleBorder(),
        child: Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.borderMain),
          ),
          child: Icon(
            Icons.arrow_back,
            size: 18,
            color: AppColors.primaryForest,
          ),
        ),
      ),
    );
  }
}
