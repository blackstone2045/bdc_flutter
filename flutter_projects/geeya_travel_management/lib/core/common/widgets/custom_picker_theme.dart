import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geeya_travel_management/core/utils/constants/app_sizer.dart';
import '../../utils/constants/app_colors.dart';

Widget customPicketTheme(BuildContext context, Widget? child){

  return Theme(
    data: Theme.of(context).copyWith(
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.dmSans(
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16.sp,
          color: Colors.teal,
        ),
      ),
      colorScheme: ColorScheme.light(
        primary: AppColors.primary, // header background color
        onPrimary: AppColors.textWhite, // header text color
        onSurface: Colors.black, // default text color
      ),
    ),
    child: child!,
  );
}