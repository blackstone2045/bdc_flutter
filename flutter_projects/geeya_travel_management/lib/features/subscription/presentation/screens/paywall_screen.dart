import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_second_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../controllers/paywall_controller.dart';
import '../../domain/entities/subscription_plan.dart';

class PaywallScreen extends GetView<PaywallController> {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: AppColors.textPrimary),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primary));
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: "Unlock Geeya",
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textHeading,
                ),
                SizedBox(height: 12.h),
                const CustomSecondText(
                  text: "Get unlimited access to all features and plan your perfect trip.",
                  fontSize: 16,
                  color: AppColors.textSubtitle,
                ),
                SizedBox(height: 32.h),
                Expanded(
                  child: ListView.separated(
                    itemCount: controller.plans.length,
                    separatorBuilder: (context, index) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final plan = controller.plans[index];
                      return Obx(() => _PlanTile(
                            plan: plan,
                            isSelected: controller.selectedPlanId.value == plan.id,
                            onTap: () => controller.selectPlan(plan.id),
                          ));
                    },
                  ),
                ),
                SizedBox(height: 24.h),
                CustomSubmitButton(
                  text: "START 7 DAY FREE TRIAL",
                  onTap: controller.startTrial,
                ),
                SizedBox(height: 16.h),
                Center(
                  child: CustomSecondText(
                    text: "Restore purchase",
                    fontSize: 12,
                    color: AppColors.textHelper,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _PlanTile extends StatelessWidget {
  final SubscriptionPlan plan;
  final bool isSelected;
  final VoidCallback onTap;

  const _PlanTile({
    required this.plan,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.surface : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.borderDefault,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomSecondText(
                        text: plan.name,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                      if (plan.isPopular) ...[
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const CustomSecondText(
                            text: "POPULAR",
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppColors.onPrimary,
                          ),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 4.h),
                  CustomSecondText(
                    text: plan.features.join(" • "),
                    fontSize: 12,
                    color: AppColors.textSubtitle,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomSecondText(
                  text: plan.price,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
                CustomSecondText(
                  text: plan.period,
                  fontSize: 10,
                  color: AppColors.textSubtitle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
