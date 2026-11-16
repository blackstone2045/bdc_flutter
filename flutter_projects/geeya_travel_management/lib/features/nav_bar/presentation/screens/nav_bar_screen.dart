import 'package:flutter/material.dart';
import 'package:geeya_travel_management/core/utils/constants/image_path.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizer.dart';
import '../../../../core/common/widgets/custom_second_text.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarScreen extends GetView<NavBarController> {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: controller.screens,
          )),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(75),
          border: Border.all(color: AppColors.borderDefault),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(0, Icons.home_outlined, "HOME"),
            _buildNavItem(1, Icons.explore_outlined, "DISCOVER"),
            _buildNavItem(2, Icons.person_outline, "YOU"),
          ],
        ),
      ),
    );
  }


  Widget _buildNavItem(int index, IconData icon, String label) {
    return Obx(() {
      final isActive = controller.currentIndex.value == index;

      return GestureDetector(
        onTap: () => controller.changeIndex(index),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCubic,
          padding: EdgeInsets.only(
            top: 12.h,
            bottom: isActive ? 0 : 16.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                scale: isActive ? 1.12 : 1.0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOutBack,
                child: Icon(
                  icon,
                  color: isActive
                      ? AppColors.primary
                      : AppColors.textInactive,
                  size: 24,
                ),
              ),

              SizedBox(height: 4.h),

              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeInOut,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isActive
                      ? AppColors.primary
                      : AppColors.textInactive,
                ),
                child: CustomSecondText(
                  text: label,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isActive
                      ? AppColors.primary
                      : AppColors.textInactive,
                ),
              ),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                reverseDuration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeInCubic,
                transitionBuilder: (child, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    axisAlignment: -1,
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                child: isActive
                    ? Padding(
                  key: ValueKey('marker_$index'),
                  padding: EdgeInsets.only(top: 6.h),
                  child: Image.asset(
                    ImagePath.navBarMarker,
                  ),
                )
                    : SizedBox(
                  key: ValueKey('empty_$index'),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

}
