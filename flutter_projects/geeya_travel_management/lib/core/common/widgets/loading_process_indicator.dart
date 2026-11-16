import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:geeya_travel_management/core/common/widgets/custom_text.dart';
import 'package:geeya_travel_management/core/utils/constants/app_sizer.dart';

import '../../utils/constants/app_colors.dart';

Future<void> loadingProgressIndicator({String? title}) async {

  if (!(Get.isDialogOpen ?? false)) {
    Get.dialog(
      Dialog(
        backgroundColor: AppColors.primary,
        insetPadding: EdgeInsets.symmetric(horizontal: 130.w),
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
                child: SpinKitWave(
                  color: AppColors.textWhite,
                  size: 24.h,
                ),
              ),
              16.heightSpace,
              CustomText(text: title ?? "Processing...", color: AppColors.textWhite, fontWeight: FontWeight.w600,)
            ],
          ),
        ),
      ),
      barrierDismissible: false,
      useSafeArea: false,
    );
  }
  await Future.delayed(Duration(milliseconds: 1500)); //
}

Future<void> hideProgressIndicator() async {
  await Future.delayed(Duration(milliseconds: 100));
  if (Get.isDialogOpen ?? false) {
    try {
      Get.back();
    } catch (e) {
      // Already closed or error while closing
    }
  }
}

