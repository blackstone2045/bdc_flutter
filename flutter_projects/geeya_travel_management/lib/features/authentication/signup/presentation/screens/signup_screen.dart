import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_second_text.dart';
import '../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../../../../../core/utils/constants/icon_path.dart';
import '../../../login/presentation/widgets/social_button_widget.dart';
import '../controllers/signup_controller.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              CustomText(
                text: "Create your account",
                fontSize: 27.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textHeading,
                lineHeight: 1.2,
                letterSpacing: -0.5,
              ),
              4.heightSpace,
              CustomSecondText(
                text: "Start your journey with geeya.",
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textHeading,
              ),
              SizedBox(height: 32.h),
              SocialButton(
                text: "Continue with Apple",
                icon: IconPath.appleIcon, // Replace with SVG if needed
                onTap: () {},
              ),
              SizedBox(height: 12.h),
              SocialButton(
                text: "Continue with Google",
                icon: IconPath.googleIcon, // Replace with SVG if needed
                onTap: () {},
              ),

              SizedBox(height: 24.h),
              Row(
                children: [
                  const Expanded(child: Divider(color: AppColors.borderDefault, thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: CustomSecondText(
                      text: "or",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.dividerText,
                    ),
                  ),
                  const Expanded(child: Divider(color: AppColors.borderDefault, thickness: 1)),
                ],
              ),
              SizedBox(height: 24.h),
              CustomTextFormField(
                controller: controller.nameController,
                hintText: "Full name",
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                controller: controller.emailController,
                hintText: "Email address",
              ),
              SizedBox(height: 16.h),
              Obx(() => CustomTextFormField(
                controller: controller.passwordController,
                hintText: "Password",
                obscureText: controller.obscurePassword.value,
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
              Obx(() => CustomDropdownField(
                hintText: "Preferred language",
                items: controller.languages,
                selectedValue: controller.selectedLanguage.value,
                onChanged: controller.setLanguage,
              )),
              SizedBox(height: 16.h),
              Obx(() => Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: controller.agreeToTerms.value,
                      onChanged: controller.toggleTerms,
                      activeColor: AppColors.primary,
                      checkColor: AppColors.onPrimary,
                      side: const BorderSide(color: AppColors.textMuted),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 12.sp,
                          color: AppColors.textHelper,
                          letterSpacing: -0.4,
                        ),
                        children: [
                          const TextSpan(text: "I agree to the "),
                          TextSpan(
                            text: "Terms of Service",
                            style: const TextStyle(
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: " and "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: const TextStyle(
                              color: AppColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              SizedBox(height: 24.h),
              Obx(() => CustomSubmitButton(
                text: "CREATE ACCOUNT",
                onTap: controller.signup,
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
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSecondText(
                    text: "Already have an account? ",
                    fontSize: 14.sp,
                    color: AppColors.textHelper,
                  ),
                  GestureDetector(
                    onTap: controller.navigateToLogin,
                    child: CustomSecondText(
                      text: "Log in",
                      fontSize: 14.sp,
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
