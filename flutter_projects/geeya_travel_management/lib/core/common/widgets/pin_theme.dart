import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geeya_travel_management/core/utils/constants/app_sizer.dart';
import 'package:pinput/pinput.dart';
import '../../utils/constants/app_colors.dart';

PinTheme defaultPinTheme(BuildContext context) {
  return PinTheme(
    width: 72.75.w,
    height: 60.h,
    textStyle: GoogleFonts.lato(
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
      fontSize: 24.sp,
    ),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.borderDefault),
    ),
  );
}

PinTheme focusedPinTheme(BuildContext context) {
  return defaultPinTheme(context).copyWith(
    decoration: defaultPinTheme(context).decoration?.copyWith(
      border: Border.all(color: AppColors.primary),
    ),
  );
}

PinTheme submittedPinTheme(BuildContext context) {
  return defaultPinTheme(context).copyWith(
    decoration: defaultPinTheme(context).decoration?.copyWith(
      color: AppColors.surface.withValues(alpha: 0.8),
    ),
  );
}
