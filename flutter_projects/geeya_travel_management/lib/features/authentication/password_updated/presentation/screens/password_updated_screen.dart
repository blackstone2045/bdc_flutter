import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_second_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../controllers/password_updated_controller.dart';

class PasswordUpdatedScreen extends GetView<PasswordUpdatedController> {
  const PasswordUpdatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                height: 100.h,
                width: 100.h,
                decoration: const BoxDecoration(
                  color: AppColors.greenLighterShade,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: AppColors.onPrimary,
                  size: 50,
                ),
              ),
              SizedBox(height: 32.h),
              CustomText(
                text: controller.title,
                fontSize: 27,
                fontWeight: FontWeight.w400,
                color: AppColors.textHeading,
                lineHeight: 1.2,
                letterSpacing: -0.5,
              ),
              SizedBox(height: 12.h),
              const CustomSecondText(
                text: "Your password has been successfully updated. You can now log in with your new password.",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.textSubtitle,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              CustomSubmitButton(
                text: "BACK TO LOG IN",
                onTap: controller.backToLogin,
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
