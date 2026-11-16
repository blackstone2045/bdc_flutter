import 'package:flutter/material.dart';
import 'package:geeya_travel_management/core/utils/constants/app_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_sizes.dart';
import 'custom_text.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.text,
    this.icon,
    this.borderColor,
    this.containerWidth,
    this.containerPadding,
    required this.onPressed, this.textColor,
  });

  final String text;
  final Widget? icon;
  final Color? borderColor;
  final Color? textColor;
  final double? containerWidth;
  final EdgeInsetsGeometry? containerPadding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(99.h),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(99.h),
        splashColor: Colors.white.withValues(alpha: 0.5),
        onTap: onPressed,
        child: Container(
          width: containerWidth,
          padding: containerPadding ?? EdgeInsets.symmetric(vertical: getHeight(17), horizontal: getWidth(16)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99.h),
            border: Border.all(color: borderColor ?? Color(0xFFEEEBE6).withValues(alpha: 0.36)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                const SizedBox(),
                SizedBox(
                  height: getHeight(23),
                  width: getWidth(23),
                  child: icon!,
                ),
              ],
              // SizedBox(
              //   width: getWidth(12),
              // ),
              CustomText(
                text: text ?? '',
                color: textColor ?? AppColors.textWhite,
                textStyle: GoogleFonts.lato(
                  fontSize: getWidth(16),
                  color: textColor ?? AppColors.textWhite,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
