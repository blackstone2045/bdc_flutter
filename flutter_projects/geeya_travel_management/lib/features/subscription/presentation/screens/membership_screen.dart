import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_second_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../controllers/membership_controller.dart';

class MembershipScreen extends GetView<MembershipController> {
  const MembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const CustomText(
          text: "Manage membership",
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
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
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderDefault),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomSecondText(
                      text: "CURRENT PLAN",
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.sectionLabel,
                      letterSpacing: 2.2,
                    ),
                    SizedBox(height: 12.h),
                    Obx(() => CustomText(
                      text: controller.currentPlan.value,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textHeading,
                    )),
                    SizedBox(height: 8.h),
                    Obx(() => CustomSecondText(
                      text: controller.price.value,
                      fontSize: 16,
                      color: AppColors.textSubtitle,
                    )),
                    SizedBox(height: 24.h),
                    const Divider(color: AppColors.borderDefault),
                    SizedBox(height: 24.h),
                    const CustomSecondText(
                      text: "NEXT BILLING DATE",
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.sectionLabel,
                      letterSpacing: 2.2,
                    ),
                    SizedBox(height: 8.h),
                    Obx(() => CustomSecondText(
                      text: controller.nextBillingDate.value,
                      fontSize: 16,
                      color: AppColors.textPrimary,
                    )),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              CustomSubmitButton(
                text: "CHANGE PLAN",
                onTap: controller.changePlan,
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: controller.cancelSubscription,
                  child: const CustomSecondText(
                    text: "Cancel subscription",
                    fontSize: 14,
                    color: AppColors.warning,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
