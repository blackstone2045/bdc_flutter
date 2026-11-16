import 'package:flutter/material.dart';
import 'package:geeya_travel_management/core/utils/constants/app_colors.dart';
import 'package:geeya_travel_management/core/utils/constants/app_sizer.dart';


class AnimatedDotsIndicator extends StatelessWidget {
  final int length;
  final int currentIndex;

  const AnimatedDotsIndicator({super.key,
    required this.length,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        final isActive = index == currentIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 9.h,
          width: isActive ? 40.w : 14.w,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}