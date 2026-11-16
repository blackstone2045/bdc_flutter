import 'package:flutter/material.dart';
import 'package:geeya_travel_management/core/common/widgets/custom_outline_button.dart';
import 'package:geeya_travel_management/core/common/widgets/custom_secondary_text.dart';
import 'package:geeya_travel_management/core/common/widgets/custom_submit_button.dart';
import 'package:geeya_travel_management/core/common/widgets/custom_text.dart';
import 'package:geeya_travel_management/core/utils/constants/app_colors.dart';
import 'package:geeya_travel_management/core/utils/constants/app_sizer.dart';
import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(controller.backGroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(controller.appLogo, height: 53.h, width: 144.w),
                SizedBox(height: 16.h),
                CustomText(text: "Your journey,", fontSize: 28.sp, color: AppColors.textWhite),
                8.heightSpace,
                CustomSecondaryText(text: "beautifully planned.", color: AppColors.primary, fontSize: 28.sp),
                24.heightSpace,
                CustomSubmitButton(text: "CREATE ACCOUNT", onTap: (){}),
                16.heightSpace,
                CustomOutlineButton(onPressed: (){}, text: "LOG IN",)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
