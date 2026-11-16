import 'package:flutter/material.dart';
import 'package:geeya_travel_management/core/utils/constants/logo_path.dart';
import 'package:get/get.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../controllers/profile_home_controller.dart';
import '../widgets/profile_widgets.dart';

class ProfileHomeScreen extends GetView<ProfileHomeController> {
  const ProfileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(LogoPath.appLogo, height: 27.h, width: 68.h),
                  Stack(children: [
                    const Icon(Icons.notifications_outlined, color: AppColors.creamCard, size: 24),
                    Positioned(
                      top: 1,
                      right: 1,
                      child: Icon(Icons.circle, color: AppColors.warning, size: 8.h),
                    )
                  ],)
                ],
              ),
              SizedBox(height: 32.h),
              Center(child: ProfileHeader(controller: controller)),
              SizedBox(height: 40.h),
              StatGrid(controller: controller),
              SizedBox(height: 32.h),
              const VaultGrid(),
              SizedBox(height: 32.h),
              CollectionSection(controller: controller),
              SizedBox(height: 32.h),
              AccountSection(
                title: "ACCOUNT",
                items: [
                  AccountRowData(
                    title: "Saved places", 
                    onTap: controller.showSavedPlaces,
                    leadingIcon: Icons.favorite_border,
                    detail: "22",
                  ),
                  AccountRowData(
                    title: "Edit profile", 
                    onTap: controller.navigateToEditProfile,
                    leadingIcon: Icons.person_outline,
                  ),
                  AccountRowData(
                    title: "Language", 
                    onTap: controller.showLanguageSelection,
                    leadingIcon: Icons.language,
                    detail: "Use device language",
                  ),
                  AccountRowData(
                    title: "Manage membership", 
                    onTap: controller.showMembership,
                    leadingIcon: PhosphorIconsRegular.crown,
                  ),
                  AccountRowData(
                    title: "Terms & Conditions", 
                    onTap: () {},
                    leadingIcon: Icons.description_outlined,
                  ),
                  AccountRowData(
                    title: "Privacy Policy", 
                    onTap: () {},
                    leadingIcon: Icons.lock_outline,
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              AccountSection(
                title: "ACCOUNT ACTIONS",
                items: [
                  AccountRowData(
                    title: "Delete account", 
                    onTap: controller.showDeleteAccount,
                    leadingIcon: Icons.delete_outline,
                    iconColor: const Color(0xFF8A4A3A),
                  ),
                  AccountRowData(
                    title: "Log out", 
                    onTap: controller.showLogout,
                    leadingIcon: Icons.logout,
                    iconColor: const Color(0xFF8A4A3A),
                  ),
                ],
              ),
              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),
    );
  }
}
