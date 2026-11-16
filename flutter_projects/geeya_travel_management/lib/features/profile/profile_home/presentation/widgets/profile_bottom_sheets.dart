import 'package:flutter/material.dart';
import 'package:geeya_travel_management/core/common/widgets/custom_outline_button.dart';
import 'package:geeya_travel_management/core/services/auth_service.dart';
import 'package:geeya_travel_management/features/profile/profile_home/presentation/controllers/profile_home_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import '../../../../../../core/common/widgets/custom_text.dart';
import '../../../../../../core/common/widgets/custom_second_text.dart';
import '../../../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../core/utils/constants/app_sizer.dart';

class SavedBottomSheet extends StatelessWidget {
  const SavedBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: const BoxDecoration(
        color: AppColors.bottomSheetBgColor, // #DCD5C4
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 4.h,
                width: 40.w,
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.smallBar,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const SizedBox(),
              ),
            ),
            CustomText(
              text: "Saved",
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textOnCream,
            ),
            CustomSecondText(
              text: "12 PLACES",
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textMuted,
            ),
            SizedBox(height: 24.h),
            // Grid of saved items
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: index == 0 ? BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)) : index == 3 ? BorderRadius.only(bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16)) : null,
                  color: Color(0xFFE5E0D4),
                ),
                margin: EdgeInsets.all(1.w),
                padding: EdgeInsets.all(14.w),
                alignment: Alignment.bottomLeft,
                child: Row(
                  spacing: 4.w,
                  children: [
                    Icon(Icons.circle, color: AppColors.brawnRed, size: 6.h),
                    Expanded(
                      child: CustomSecondText(
                        text: "Prado · Lisbon",
                        fontSize: 14.sp,
                        color: Color(0xFF2E2A1E),
                      ),
                    ),
                    Icon(Icons.favorite, color: AppColors.primary, size: 14.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.h),
            CustomSubmitButton(
              text: "Close",
              color: const Color(0xFF1F3A2E), // Deep green from cream cards
              textColor: Colors.white,
              onTap: () => Get.back(),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}

class MembershipBottomSheet extends StatelessWidget {
  const MembershipBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: const BoxDecoration(
        color: AppColors.bottomSheetBgColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 4.h,
                width: 40.w,
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.smallBar,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const SizedBox(),
              ),
            ),
            CustomText(
              text: "Manage membership",
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textOnCream,
            ),
            SizedBox(height: 4.h),
            CustomSecondText(text: "Billing and cancellation are managed securely by Apple App Store or Google Play.", color: AppColors.textOnCream.withValues(alpha: 0.8),),
            SizedBox(height: 24.h),
            CustomSubmitButton(
              text: "OPEN SUBSCRIPTION SETTINGS",
              color: const Color(0xFF1F3A2E),
              textColor: Colors.white,
              onTap: () {
                Get.back();
                Get.bottomSheet(
                  SubscriptionPaywallBottomSheet(),
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionPaywallBottomSheet extends StatelessWidget {
  SubscriptionPaywallBottomSheet({super.key});
  final ProfileHomeController controller = Get.find<ProfileHomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.94,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Center(
                  child: Container(
                    height: 4.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.textWhite.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    CustomText(
                      text: "Unlock Geeya",
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textHeading,
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: CustomSecondText(
                        text: "CLOSE",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textMuted,
                          letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                CustomSecondText(
                  text: "plan it, organize it, keep it.",
                    fontSize: 16.sp,
                    color: AppColors.textSubtitle,
                ),
                SizedBox(height: 32.h),
                // Monthly/Yearly Toggle
                Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: AppColors.textBlack.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Obx(() =>
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                controller.chooseMonthlyPlan.value = true;
                              },
                              child: AnimatedContainer(
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: controller.chooseMonthlyPlan.value ? AppColors.primary : Colors.transparent,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                duration: Duration(milliseconds: 300),
                                child: Center(
                                  child: CustomSecondText(
                                    text: "MONTHLY",
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700,
                                      color: controller.chooseMonthlyPlan.value ? AppColors.onPrimary : AppColors.textSubtitle,
                                      letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                controller.chooseMonthlyPlan.value = false;
                              },
                              child: AnimatedContainer(
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: !controller.chooseMonthlyPlan.value ? AppColors.primary : Colors.transparent,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                duration: Duration(milliseconds: 300),
                                child: Center(
                                  child: CustomSecondText(
                                    text: "YEARLY • SAVE 20%",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                    color: !controller.chooseMonthlyPlan.value ? AppColors.onPrimary : AppColors.textSubtitle,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ),
                SizedBox(height: 32.h),
                // Plan Selection
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Obx(() =>
                          GestureDetector(
                            onTap: (){
                              controller.choosePlanType.value = "Explorer";
                            },
                            child: _PlanCard(
                              title: "Explorer",
                              price: r"$39.99/yr",
                              isSelected: (controller.choosePlanType.value == "Explorer"),
                            ),
                          )
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Obx(() =>
                          GestureDetector(
                            onTap: (){
                              controller.choosePlanType.value = "Adventurer";
                            },
                            child: _PlanCard(
                              title: "Adventurer",
                              price: r"$79.99/yr",
                              isSelected: (controller.choosePlanType.value == "Adventurer"),
                              isPopular: true,
                            ),
                          )
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Obx(() =>
                          GestureDetector(
                            onTap: (){
                              controller.choosePlanType.value = "Globetrotter";
                            },
                            child: _PlanCard(
                              title: "Globetrotter",
                              price: r"$119.99/yr",
                              isSelected: (controller.choosePlanType.value == "Globetrotter"),
                            ),
                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Text(
                  "everything you need to plan a trip properly.",
                  style: GoogleFonts.fraunces(
                    fontSize: 16.sp,
                    color: AppColors.textHeading,
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  "INCLUDED",
                  style: GoogleFonts.lato(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSubtitle,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 16.h),
                // Features Grid
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.h,
                  crossAxisSpacing: 8.w,
                  childAspectRatio: 1.4,
                  children: const [
                    _FeatureTile(title: "Unlimited Trips"),
                    _FeatureTile(title: "Itineraries"),
                    _FeatureTile(title: "Hotels"),
                    _FeatureTile(title: "Restaurants"),
                    _FeatureTile(title: "Maps"),
                    _FeatureTile(title: "Boarding Passes"),
                    _FeatureTile(title: "Confirmations"),
                    _FeatureTile(title: "Offline"),
                    _FeatureTile(title: "Budget"),
                  ],
                ),
                SizedBox(height: 32.h),
                Text(
                  "UNLOCK NEXT",
                  style: GoogleFonts.lato(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSubtitle,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 16.h),
                // Locked features
                const _LockedFeatureCard(
                  title: "Packing Lists",
                  description:
                      "Everything you need before you fly, sorted by category.",
                  imageUrl:
                      "https://images.unsplash.com/photo-1523906834658-6e24ef2386f9?w=500&q=80",
                ),
                SizedBox(height: 12.h),
                const _LockedFeatureCard(
                  title: "Travel Vault",
                  description:
                      "Boarding passes, hotels, tickets and documents in one place.",
                  imageUrl:
                      "https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=500&q=80",
                ),
                SizedBox(height: 120.h),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.background.withValues(alpha: 0),
                    AppColors.background,
                  ],
                ),
              ),
              child: Column(
                children: [
                  CustomSubmitButton(
                    text: "START 7-DAY FREE TRIAL",
                    color: AppColors.primary,
                    textColor: AppColors.onPrimary,
                    onTap: () {
                      Get.back();
                    },
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "billed yearly • cancel anytime",
                    style: GoogleFonts.lato(
                      fontSize: 10.sp,
                      color: AppColors.textSubtitle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final bool isSelected;
  final bool isPopular;

  const _PlanCard({
    required this.title,
    required this.price,
    required this.isSelected,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.textWhite.withValues(alpha: isSelected ? 0.1 : 0),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.borderDefault,
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Column(
            children: [
              CustomText(
                text: title,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? Colors.white : AppColors.textSubtitle,

              ),
              SizedBox(height: 4.h),
              CustomText(
                text: price,
                  fontSize: 11.sp,
                  fontStyle: FontStyle.italic,
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.textSubtitle.withValues(alpha: 0.5),
              ),
            ],
          ),
        ),
        if (isPopular)
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: CustomSecondText(
                text: "POPULAR",
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.onPrimary,
              ),
            ),
          )
        else
          SizedBox(height: 14.h),

      ],
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final String title;

  const _FeatureTile({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      padding: EdgeInsets.all(8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "g.",
            style: GoogleFonts.fraunces(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 9.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSubtitle,
            ),
          ),
        ],
      ),
    );
  }
}

class _LockedFeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const _LockedFeatureCard({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.2),
              Colors.black.withValues(alpha: 0.9),
            ],
          ),
        ),
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                ),
                child: const Icon(PhosphorIconsLight.lock,
                    color: Colors.white, size: 24),
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: GoogleFonts.fraunces(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              description,
              style: GoogleFonts.lato(
                fontSize: 12.sp,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "AVAILABLE IN ADVENTURER",
              style: GoogleFonts.lato(
                fontSize: 8.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: const BoxDecoration(
        color: AppColors.bottomSheetBgColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 4.h,
                width: 40.w,
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.smallBar,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const SizedBox(),
              ),
            ),
            CustomText(
              text: "Log out?",
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textOnCream,
            ),
            SizedBox(height: 4.h),
            CustomSecondText(text: "Securely Logout of your account and return anytime.", color: AppColors.textOnCream.withValues(alpha: 0.8),),
            SizedBox(height: 24.h),
            CustomSubmitButton(
              text: "NO CANCEL",
              color: const Color(0xFF1F3A2E),
              textColor: Colors.white,
              onTap: () {
                Get.back();
              },
            ),
            12.heightSpace,
            CustomOutlineButton(text: "YES, LOG OUT", onPressed: (){
              AuthService.logoutUser();
            },textColor: AppColors.warning,
              borderColor: AppColors.warning,
            )
          ],
        ),
      ),
    );
  }
}

class DeleteAccountBottomSheet extends StatelessWidget {
  const DeleteAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: const BoxDecoration(
        color: AppColors.bottomSheetBgColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 4.h,
                width: 40.w,
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.smallBar,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const SizedBox(),
              ),
            ),
            CustomText(
              text: "Delete your account?",
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textOnCream,
            ),
            SizedBox(height: 4.h),
            CustomSecondText(text: "This permanently removes your account and saved places.", color: AppColors.textOnCream.withValues(alpha: 0.8),),
            SizedBox(height: 24.h),
            CustomSubmitButton(
              text: "KEEP ACCOUNT",
              color: const Color(0xFF1F3A2E),
              textColor: Colors.white,
              onTap: () {
                Get.back();
              },
            ),
            12.heightSpace,
            CustomOutlineButton(text: "DELETE ACCOUNT", onPressed: (){
              AuthService.logoutUser();
            },textColor: AppColors.warning,
              borderColor: AppColors.warning,
            )
          ],
        ),
      ),
    );
  }
}

class ActionDialog extends StatelessWidget {
  final String title;
  final String description;
  final String confirmText;
  final VoidCallback onConfirm;
  final bool isDestructive;

  const ActionDialog({
    super.key,
    required this.title,
    required this.description,
    required this.confirmText,
    required this.onConfirm,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.bottomSheetBgColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: title,
              fontSize: 24,
              color: AppColors.textOnCream,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            CustomSecondText(
              text: description,
              fontSize: 14,
              color: AppColors.textOnCream,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Get.back(),
                    child: const CustomSecondText(
                      text: "Cancel",
                      fontSize: 14,
                      color: AppColors.textOnCream,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomSubmitButton(
                    text: confirmText,
                    color: isDestructive ? AppColors.warning : const Color(0xFF1F3A2E),
                    textColor: Colors.white,
                    onTap: onConfirm,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
