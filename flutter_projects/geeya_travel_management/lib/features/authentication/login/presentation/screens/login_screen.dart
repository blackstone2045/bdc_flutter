import 'package:flutter/material.dart';
import 'package:geeya_travel_management/core/utils/constants/icon_path.dart';
import 'package:geeya_travel_management/core/utils/validators/app_validator.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_second_text.dart';
import '../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../controllers/login_controller.dart';
import '../widgets/social_button_widget.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

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
                text: "Welcome back",
                fontSize: 27.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textHeading,
                lineHeight: 1.2,
                letterSpacing: -0.5,
              ),
              4.heightSpace,
              CustomSecondText(
                text: "log in to continue your adventures.",
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textHeading,
              ),
              SizedBox(height: 32.h),
              CustomTextFormField(
                controller: controller.emailController,
                hintText: "Email address",
                validation: (value) => AppValidator.validateField(value, "Email"),
              ),
              SizedBox(height: 16.h),
              Obx(() => CustomTextFormField(
                controller: controller.passwordController,
                hintText: "Password",
                obscureText: controller.obscurePassword.value,
                validation: (value) => AppValidator.validateField(value, "Password"),
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
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.navigateToForgotPassword,
                  child: CustomSecondText(
                    text: "Forgot password?",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Obx(() => CustomSubmitButton(
                text: "LOG IN",
                onTap: controller.login,
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
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSecondText(
                    text: "Don't have an account? ",
                    color: AppColors.textHelper,
                  ),
                  GestureDetector(
                    onTap: controller.navigateToSignup,
                    child: CustomSecondText(
                      text: "Sign up",
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primary,
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


