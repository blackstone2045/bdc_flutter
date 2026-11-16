import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_sizer.dart';
import 'custom_second_text.dart';

class CustomSubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Widget? prefixIcon;
  final Widget? nextIcon;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final RxDouble scale = 1.0.obs;

  CustomSubmitButton({
    super.key,
    required this.text,
    required this.onTap,
    this.prefixIcon,
    this.nextIcon,
    this.child,
    this.padding,
    this.borderRadius,
    this.color,
    this.textColor,
    this.borderColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        AnimatedScale(
          scale: scale.value,
          duration: const Duration(milliseconds: 200),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white.withValues(alpha: 0.2),
              borderRadius: borderRadius ?? BorderRadius.circular(100.h),
              onTap: onTap,
              onTapDown: (value) async {
                scale.value = 0.95;
                await Future.delayed(const Duration(milliseconds: 200));
                scale.value = 1;
              },
              child: Container(
                width: width ?? double.infinity,
                height: height ?? 46.h,
                padding: padding,
                decoration: BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(100.h),
                  color: color ?? AppColors.primary,
                  border: borderColor != null ? Border.all(color: borderColor!) : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (prefixIcon != null) ...[
                      SizedBox(
                        height: 22.h,
                        width: 22.h,
                        child: prefixIcon!,
                      ),
                      SizedBox(width: 12.w),
                    ],
                    if (child == null)
                      CustomSecondText(
                        text: text.toUpperCase(),
                        textAlign: TextAlign.center,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: textColor ?? AppColors.onPrimary,
                        letterSpacing: 2.2,
                      )
                    else
                      child!,
                    if (nextIcon != null) ...[
                      SizedBox(width: 8.w),
                      SizedBox(
                        width: 25.h,
                        child: nextIcon!,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
