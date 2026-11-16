import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geeya_travel_management/core/utils/constants/app_sizer.dart';

import '../../utils/constants/app_colors.dart';
import 'custom_text.dart';

Future<void> successProcess({String? title}) async {
  Get.back();
  if (!(Get.isDialogOpen ?? false)) {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.primary,
        insetPadding: EdgeInsets.symmetric(horizontal: 100.w),
        shape: RoundedRectangleBorder(
          borderRadius: 8.radius
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 25.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(CupertinoIcons.checkmark_alt, color: AppColors.textWhite, size: 60.h,)
              ),
              16.heightSpace,
              CustomText(text: title ?? "Successful", color: AppColors.textWhite, fontWeight: FontWeight.w600, textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
      barrierDismissible: false,
      useSafeArea: false,
    );
  }
  await Future.delayed(Duration(milliseconds: 1500));
  Get.back();//
}

Future<void> failedProcess({String? title}) async {
  Get.back();
  if (!(Get.isDialogOpen ?? false)) {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.primary,
        insetPadding: EdgeInsets.symmetric(horizontal: 100.w),
        shape: RoundedRectangleBorder(
          borderRadius: 8.radius
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 25.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(Icons.close_sharp, color: AppColors.textWhite, size: 60.h,)
              ),
              16.heightSpace,
              CustomText(text: title ?? "Failed", color: AppColors.textWhite, fontWeight: FontWeight.w600, textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
      barrierDismissible: false,
      useSafeArea: false,
    );
  }
  await Future.delayed(Duration(milliseconds: 2500));
  Get.back();//
}



