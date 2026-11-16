import 'package:flutter/material.dart';
import 'package:geeya_travel_management/core/utils/constants/image_path.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_outline_button.dart';
import '../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(controller.welcomeBgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  controller.appLogo,
                  height: 53.h,
                  width: 144.w,
                ),
                SizedBox(height: 16.h),
                Image.asset(ImagePath.splashSecondTextImage, width: 372.w, height: 60.h, alignment: AlignmentDirectional.centerStart,),
                // const CustomText(
                //   text: "Your journey,",
                //   fontSize: 27,
                //   fontWeight: FontWeight.w400,
                //   color: AppColors.textPrimary,
                //   lineHeight: 1.2,
                //   letterSpacing: -0.5,
                // ),
                // const CustomText(
                //   text: "beautifully planned.",
                //   fontSize: 27,
                //   fontWeight: FontWeight.w400,
                //   color: AppColors.primary,
                //   lineHeight: 1.2,
                //   letterSpacing: -0.5,
                // ),
                SizedBox(height: 24.h),
                CustomSubmitButton(
                  text: "CREATE ACCOUNT",
                  onTap: controller.navigateToSignup,
                ),
                SizedBox(height: 16.h),
                CustomOutlineButton(
                  onPressed: controller.navigateToLogin,
                  text: "LOG IN",
                  borderColor: AppColors.textHeading.withValues(alpha: 0.36),
                ),
                SizedBox(height: 24.h),
                Center(child: Image.asset(ImagePath.bottomDotsImage))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
