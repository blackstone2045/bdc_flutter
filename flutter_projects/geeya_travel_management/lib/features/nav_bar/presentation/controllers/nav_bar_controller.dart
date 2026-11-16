import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geeya_travel_management/features/home/presentation/screens/home_screen.dart';
import 'package:geeya_travel_management/features/profile/profile_home/presentation/screens/profile_home_screen.dart';
import 'package:get/get.dart';

import '../../../discover/presentation/screens/discover_screen.dart';

class NavBarController extends GetxController {
  final currentIndex = 0.obs; // Discover is the middle tab, usually starting here based on "Pick where you go"

  final List<Widget> screens = [
    const HomeScreen(), // Placeholder for Home
    const DiscoverScreen(),
    const ProfileHomeScreen(), // Placeholder for Profile
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
