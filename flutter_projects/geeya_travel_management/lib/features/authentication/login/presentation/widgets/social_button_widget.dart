import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_second_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';

class SocialButton extends StatelessWidget {

  final String text;
  final String icon;
  final VoidCallback onTap;

  const SocialButton({super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 48.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderSocial),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8.w,
          children: [
            Image.asset(icon),
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: CustomSecondText(
                text: text,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.socialText,
                letterSpacing: -0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}