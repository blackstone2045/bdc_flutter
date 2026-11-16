import 'package:flutter/material.dart';
import 'package:geeya_travel_management/core/utils/constants/logo_path.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/common/widgets/custom_second_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizer.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _buildAppBar(),
              SizedBox(height: 16.h),
              CustomText(
                text: "Places worth going out of your way for.",
                fontSize: 32.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textHeading,
                letterSpacing: -0.5,
              ),
              SizedBox(height: 12.h),
              CustomSecondText(
                text: "Guides and recommendations selected for how a place actually feels.",
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textSubtitle,
                lineHeight: 1.4,
              ),
              SizedBox(height: 24.h),
              _buildSectionHeader("Featured destinations", onSeeAll: () {}),
              SizedBox(height: 16.h),
              _buildFeaturedDestinations(),
              SizedBox(height: 24.h),
              _buildSectionHeader("Worth knowing"),
              SizedBox(height: 16.h),
              _buildWorthKnowingCard(),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(LogoPath.appLogo, width: 90.w, height: 35.h, fit: BoxFit.fill,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.5)),
            color: AppColors.primary.withValues(alpha: 0.1)
          ),
          child: CustomSecondText(
            text: "Full access - ends tonight",
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, {VoidCallback? onSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSecondText(
          text: title,
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.textSubtitle,
          letterSpacing: 0,
        ),
        if (onSeeAll != null)
          GestureDetector(
            onTap: onSeeAll,
            child: CustomSecondText(
              text: "See all",
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
            ),
          ),
      ],
    );
  }

  Widget _buildFeaturedDestinations() {
    return SizedBox(
      height: 320.h,
      child: Obx(() => ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: controller.featuredDestinations.length,
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final dest = controller.featuredDestinations[index];
              return GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoute.guideDetails);
                },
                child: _FeaturedCard(
                  city: dest['city']!,
                  country: dest['country']!,
                  tag: dest['tag']!,
                  description: dest['description']!,
                  imageUrl: dest['image']!,
                ),
              );
            },
          )),
    );
  }

  Widget _buildWorthKnowingCard() {
    return Obx(() {
      final data = controller.worthKnowing;
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.borderDefault),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: data['title']!,
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textHeading,
                lineHeight: 1.2,
            ),
            SizedBox(height: 12.h),
            CustomSecondText(
              text: data['description']!,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textSubtitle,
              lineHeight: 1.45,
            ),
            SizedBox(height: 24.h),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.5), // Even darker shade for quote
                borderRadius: BorderRadius.only(topRight: Radius.circular(12.h), bottomRight:  Radius.circular(12.h)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.textBlack.withValues(alpha: 0.5), // Even darker shade for quote
                  borderRadius: BorderRadius.only(topRight: Radius.circular(12.h), bottomRight:  Radius.circular(12.h)),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 2.w,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomSecondText(
                                text: "GEEYA SAYS",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                                letterSpacing: 1.5,
                              ),
                              SizedBox(height: 8.h),
                              CustomSecondText(
                                text: data['quote']!,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                                lineHeight: 1.4,
                              ),
                              SizedBox(height: 12.h),
                              CustomText(
                                text: data['author']!,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _FeaturedCard extends StatelessWidget {
  final String city;
  final String country;
  final String tag;
  final String description;
  final String imageUrl;

  const _FeaturedCard({
    required this.city,
    required this.country,
    required this.tag,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.h),
        border: Border.all(color: AppColors.borderDefault),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.85),
                  ],
                  stops: const [0.4, 1.0],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomSecondText(
                  text: "$country · $tag",
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.lavenderText,
                  letterSpacing: 1.0,
                ),
                SizedBox(height: 10.h),
                Text(
                  city,
                  style: GoogleFonts.fraunces(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textHeading,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomSecondText(
                  text: description,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSubtitle,
                  maxLines: 2,
                  lineHeight: 1.4,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
