import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_second_text.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../controllers/language_controller.dart';

class LanguageScreen extends GetView<LanguageController> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: AbsorbPointer(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const Icon(Icons.arrow_back_ios_new, color: AppColors.textHeading, size: 20),
          )),
          onTap: () => Get.back(),
        ),
        title: CustomText(
          text: "Language",
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
            children: [
              CustomSecondText(
                text: "CURRENTLY DEVICE LANGUAGE",
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted,
                letterSpacing: 1.2,
              ),
              SizedBox(height: 32.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.borderDefault),
                ),
                child: Obx(() => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(controller.languages.length, (index) {
                    final language = controller.languages[index];
                    final isSelected = controller.selectedLanguage.value == language;
                    return Column(
                      children: [
                        ListTile(
                          splashColor: Colors.transparent,
                          selectedColor: Colors.transparent,
                          onTap: () => controller.setLanguage(language),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                          title: CustomText(
                            text: language,
                            fontSize: 14.sp,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                            color: AppColors.textHeading,
                          ),
                          trailing: Container(
                            height: 22.h,
                            width: 22.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? AppColors.primary : AppColors.textSubtitle.withValues(alpha: 0.3),
                                width: 1,
                              ),
                              color: isSelected ? AppColors.textSubtitle : Colors.transparent,
                            ),
                            child: isSelected 
                              ? Icon(Icons.check, size: 14.h, color: AppColors.onPrimary)
                              : null,
                          ),
                        ),
                        if (index != controller.languages.length - 1)
                          Divider(
                            color: AppColors.borderDefault,
                            height: 1,
                            indent: 20.w,
                            endIndent: 20.w,
                          ),
                      ],
                    );
                  }),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
