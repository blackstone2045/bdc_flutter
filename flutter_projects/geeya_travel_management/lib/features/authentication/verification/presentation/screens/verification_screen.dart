import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_second_text.dart';
import '../../../../../core/common/widgets/pin_theme.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../controllers/verification_controller.dart';

class VerificationScreen extends GetView<VerificationController> {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              CustomText(
                text: "Verification code",
                fontSize: 27.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textHeading,
                lineHeight: 1.2,
                letterSpacing: -0.5,
              ),
              SizedBox(height: 12.h),
              CustomSecondText(
                text: "We have sent the verification code to your email ${controller.email}",
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSubtitle,
              ),
              SizedBox(height: 32.h),
              Center(
                child: Pinput(
                  controller: controller.otpController,
                  length: 4,
                  defaultPinTheme: defaultPinTheme(context),
                  focusedPinTheme: focusedPinTheme(context),
                  submittedPinTheme: submittedPinTheme(context),
                  showCursor: true,
                  onCompleted: (pin) => controller.verify(),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSecondText(
                    text: "Didn't receive the code? ",
                    fontSize: 12.sp,
                    color: AppColors.textHelper,
                  ),
                  GestureDetector(
                    onTap: controller.resendCode,
                    child: CustomSecondText(
                      text: "Resend code",
                      fontSize: 12.sp,
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Obx(() => CustomSubmitButton(
                text: "VERIFY",
                onTap: controller.verify,
                child: controller.isLoading.value
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: AppColors.onPrimary,
                          strokeWidth: 2,
                        ),
                      )
                    : null,
              )),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
