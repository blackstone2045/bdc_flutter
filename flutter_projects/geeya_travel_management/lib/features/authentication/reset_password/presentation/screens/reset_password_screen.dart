import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_second_text.dart';
import '../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../../../../../core/utils/validators/app_validator.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
                  text: "Choose a new password for your account.",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSubtitle,
                ),
                SizedBox(height: 32.h),
                Obx(() => CustomTextFormField(
                  controller: controller.passwordController,
                  hintText: "New password",
                  obscureText: controller.obscurePassword.value,
                  validation: (value) => AppValidator.validateField(value, "New Password"),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.obscurePassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.textPlaceholder,
                      size: 20,
                    ),
                    onPressed: controller.toggleObscurePassword,
                  ),
                )),
                SizedBox(height: 16.h),
                Obx(() => CustomTextFormField(
                  controller: controller.confirmPasswordController,
                  hintText: "Confirm new password",
                  obscureText: controller.obscureConfirmPassword.value,
                  validation: (value) => AppValidator.matchPassword(value, controller.passwordController.text),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.obscureConfirmPassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.textPlaceholder,
                      size: 20,
                    ),
                    onPressed: controller.toggleObscureConfirmPassword,
                  ),
                )),
                const Spacer(),
                Obx(() => CustomSubmitButton(
                  text: "CONTINUE",
                  onTap: controller.updatePassword,
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
