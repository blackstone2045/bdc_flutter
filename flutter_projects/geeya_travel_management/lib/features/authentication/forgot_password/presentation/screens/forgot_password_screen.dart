import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_second_text.dart';
import '../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../../../../../core/utils/validators/app_validator.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

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
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                CustomText(
                  text: "Reset your password",
                  fontSize: 27.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textHeading,
                  lineHeight: 1.2,
                  letterSpacing: -0.5,
                ),
                SizedBox(height: 12.h),
                CustomSecondText(
                  text: "Enter your email address and we'll send you a code to reset your password.",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSubtitle,
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  controller: controller.emailController,
                  hintText: "Email address",
                  validation: (value) => AppValidator.validateField(value, "Email"),
                ),
                const Spacer(),
                Obx(() => CustomSubmitButton(
                  text: "SEND CODE",
                  onTap: controller.sendResetCode,
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
      ),
    );
  }
}
