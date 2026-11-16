import 'package:flutter/material.dart';
import 'package:geeya_travel_management/core/common/widgets/custom_text.dart';
import 'package:get/get.dart';
import '../../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../../core/common/widgets/custom_second_text.dart';
import '../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../core/utils/constants/app_sizer.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: AbsorbPointer(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: const Icon(Icons.arrow_back_ios_new, color: AppColors.textHeading, size: 20)),
          ),
          onTap: () => Get.back(),
        ),
        title: CustomText(
          text: "Edit profile",
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textHeading,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              CustomTextFormField(
                controller: controller.nameController,
                hintText: "Full name",
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                controller: controller.emailController,
                hintText: "Email address",
                readonly: true,
              ),
              SizedBox(height: 12.h),
              const CustomSecondText(
                text: "Email is managed by your sign-in provider.",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.textMuted,
              ),
              const Spacer(),
              CustomSubmitButton(
                text: "SAVE CHANGES",
                onTap: controller.saveChanges,
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
