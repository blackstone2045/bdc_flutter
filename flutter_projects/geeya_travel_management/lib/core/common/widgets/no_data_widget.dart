import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_sizer.dart';
import 'custom_text.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, this.onTap, this.message, this.paddingPercentage});

  final Function()? onTap;
  final String? message;
  final double? paddingPercentage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: SizeUtils.height * (paddingPercentage ?? 0.32)),
        child: Column(
          spacing: 8.h,
          children: [
            if(onTap != null)
              GestureDetector(
                  onTap: onTap,
                  child: Icon(Icons.refresh_rounded, color: AppColors.primary, size: 35.h,)),
            CustomText(text: message ?? "No Data Found", fontSize: 16.sp, color: AppColors.primary, textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
