import 'package:flutter/material.dart';
import 'package:geeya_travel_management/core/common/widgets/custom_second_text.dart';
import 'package:geeya_travel_management/core/common/widgets/custom_submit_button.dart';
import 'package:geeya_travel_management/core/utils/constants/app_colors.dart';
import 'package:geeya_travel_management/core/utils/constants/app_sizer.dart';
import 'package:geeya_travel_management/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/image_path.dart';

class AccountCreateWelcomeMessageScreen extends StatelessWidget {
  const AccountCreateWelcomeMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.geeyaWelcomeScreenImage),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(ImagePath.welcomeScreenContentImage, width: 300.h, height: 380.w,),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8.h,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.w),
                child: CustomSubmitButton(text: "LET'S GO", onTap: (){
                  Get.toNamed(AppRoute.navBar);
                }, nextIcon: Icon(Icons.arrow_forward, color: AppColors.onPrimary, size: 20,),
                ),
              ),
              CustomSecondText(text: "guides for travelling slowly, and well.", color: AppColors.primary, fontSize: 14.sp,)
            ],
          ),
        ),
      )
    );
  }
}
