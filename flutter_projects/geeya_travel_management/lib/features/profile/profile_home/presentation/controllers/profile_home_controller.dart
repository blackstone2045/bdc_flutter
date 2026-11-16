import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../routes/app_routes.dart';
import '../widgets/profile_bottom_sheets.dart';

class ProfileHomeController extends GetxController {
  final userName = "Cristina".obs;
  final userEmail = "cristina@example.com".obs;
  final selectedLanguage = "English".obs;
  final chooseMonthlyPlan = false.obs;
  final choosePlanType = "Explorer".obs;

  // Stats matching the provided image
  final countries = 8.obs;
  final cities = 14.obs;
  final trips = 6.obs;
  final hotels = 9.obs;
  final flights = 23.obs;
  final kmWalked = "21.6".obs;

  // Mock Collections matching the image titles
  final collections = [
    {
      'title': "Cafes I'd fly back for",
      'subtitle': "4 SAVED • PRIVATE",
      'gradient': [const Color(0xFF8B7053), const Color(0xFF4A3C2A)]
    },
    {
      'title': "Favorite sunsets",
      'subtitle': "9 SAVED • PRIVATE",
      'gradient': [const Color(0xFF9E6359), const Color(0xFF5A352F)]
    },
    {
      'title': "Best bars",
      'subtitle': "3 SAVED • PRIVATE",
      'gradient': [const Color(0xFF5D6B53), const Color(0xFF333E2A)]
    },
  ].obs;

  void showSavedPlaces() {
    Get.bottomSheet(
      const SavedBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  void navigateToEditProfile() => Get.toNamed(AppRoute.editProfile);

  void showLanguageSelection() {
    Get.toNamed(AppRoute.languageScreen);
  }

  void showMembership() {
    Get.bottomSheet(
      const MembershipBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
  
  void showLogout() {
    Get.bottomSheet(
      const LogoutBottomSheet(),
      backgroundColor: Colors.transparent,
    );
  }

  void showDeleteAccount() {
    Get.bottomSheet(
      const DeleteAccountBottomSheet(),
      backgroundColor: Colors.transparent,
    );
  }
}
