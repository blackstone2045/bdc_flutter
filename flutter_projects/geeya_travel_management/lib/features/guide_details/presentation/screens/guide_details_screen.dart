import 'package:flutter/material.dart';
import 'package:geeya_travel_management/core/common/widgets/custom_text.dart';
import 'package:get/get.dart';
import '../../../../core/common/widgets/custom_second_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_sizer.dart';
import '../controllers/guide_details_controller.dart';
import '../../domain/entities/guide_details.dart';

class GuideDetailsScreen extends GetView<GuideDetailsController> {
  const GuideDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: AppColors.primary));
        }
        final guide = controller.guide.value!;
        return CustomScrollView(
          slivers: [
            _buildHero(guide),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTabs(),
                  32.heightSpace,
                  _buildOverview(guide),
                  32.heightSpace,
                  _buildPlanSections(guide),
                  40.heightSpace,
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildHero(GuideDetails guide) {
    var isFavorite = false.obs;
    return SliverAppBar(
      expandedHeight: 450.h,
      backgroundColor: AppColors.background,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              guide.heroImage,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.background.withValues(alpha: 0.7),
                    AppColors.background,
                  ],
                  stops: const [0.5, 0.85, 1.0],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 8.w,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          padding:  EdgeInsets.all(13.h),
                          decoration: BoxDecoration(
                            color: AppColors.textWhite.withValues(alpha: 0.08),
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFFF3EDE4).withValues(alpha: 0.5), width: 1)
                          ),
                          child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          isFavorite.value = !isFavorite.value;
                        },
                        child: Container(
                          padding:  EdgeInsets.all(13.h),
                          decoration: BoxDecoration(
                              color: AppColors.textWhite.withValues(alpha: 0.08),
                              shape: BoxShape.circle,
                              border: Border.all(color: Color(0xFFF3EDE4).withValues(alpha: 0.5), width: 1)
                          ),
                          child:  Obx(() => Icon(isFavorite.value ? Icons.favorite_rounded : Icons.favorite_outline_rounded, color: isFavorite.value ? AppColors.error : AppColors.textWhite, size: 20.h)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30.h,
              left: 24.w,
              right: 24.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSecondText(
                    text: "${guide.country} · ${guide.tag}",
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lavenderText,
                    letterSpacing: 1.0,
                  ),
                  8.heightSpace,
                  CustomText(
                    text: guide.city,
                      fontSize: 48.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textHeading,
                  ),
                  8.heightSpace,
                  CustomSecondText(
                    text: guide.description,
                    fontSize: 12.sp,
                    color: AppColors.textSubtitle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Obx(() => Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFEEEBE6).withValues(alpha: 0.1), width: 1), top: BorderSide(color: Color(0xFFEEEBE6).withValues(alpha: 0.1), width: 1)),
        color: Color(0xFF1F240C).withValues(alpha: 0.95)
      ),
      padding: EdgeInsets.only(top: 8.h, left: 24.w, right: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
              flex: 1,
              child: _tabItem("Overview", controller.activeTab.value == 0, () => controller.changeTab(0))),
          32.widthSpace,
          Flexible(
              flex: 1,
              child: _tabItem("Things to do", controller.activeTab.value == 1, () => controller.changeTab(1))),
        ],
      ),
    ));
  }

  Widget _tabItem(String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: Column(
          children: [
            CustomText(
              text: label,
              fontSize: 14.sp,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              color: isActive ? AppColors.primary : AppColors.textSubtitle,
            ),
            12.heightSpace,
            if (isActive)
              Divider(
                height: 2,
                thickness: 2.h,
                color: AppColors.primary,
              )
            else
              const SizedBox(height: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildOverview(GuideDetails guide) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSecondText(
            text: "OVERVIEW",
            fontSize: 10.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.sectionLabel,
            letterSpacing: 2.2,
          ),
          16.heightSpace,
          CustomText(
            text: guide.overviewTitle,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textHeading,
          ),
          16.heightSpace,
          CustomSecondText(
            text: guide.overviewBody,
            fontSize: 15.sp,
            color: AppColors.textSubtitle,
            lineHeight: 1.6,
          ),
          24.heightSpace,
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.5), // Even darker shade for quote
              borderRadius: BorderRadius.only(topRight: Radius.circular(12.h), bottomRight:  Radius.circular(12.h)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.textBlack.withValues(alpha: 0.62), // Even darker shade for quote
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
                              text: guide.geeyaSays,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primary,
                              lineHeight: 1.4,
                            ),
                            SizedBox(height: 12.h),
                            CustomText(
                              text: "g.",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textPrimary,
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
          24.heightSpace,
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(guide.secondImage, height: 327.h, width: double.infinity, fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanSections(GuideDetails guide) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSecondText(
            key: controller.targetKey,
            text: "Things to do",
            fontSize: 10.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.sectionLabel,
            letterSpacing: 2.2,
          ),
          16.heightSpace,
          ...List.generate(guide.sections.length, (index) {
            final section = guide.sections[index];
            return Column(
              children: [
                _buildSectionHeader(section, index),
                if (section.isExpanded)...[
                  Divider(
                    color: Color(0xFFC8C1B1),
                    height: 1,
                    thickness: 1,
                  )
                ],
                if (section.isExpanded) _buildExpandedSection(section),
                12.heightSpace,
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(PlanSection section, int index) {
    return GestureDetector(
      onTap: () => controller.toggleSection(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColors.creamCard,
          borderRadius: section.isExpanded
              ? const BorderRadius.vertical(top: Radius.circular(16))
              : BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.textOnCream.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(_getIconForSection(section.icon), color: AppColors.textOnCream, size: 22),
            ),
            20.widthSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: section.title,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textOnCream,
                  ),
                  4.heightSpace,
                  CustomSecondText(
                    text: "${section.suggestionCount} suggestions",
                    fontSize: 11.sp,
                    color: AppColors.textOnCream.withValues(alpha: 0.6),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomSecondText(
                  text: section.time,
                  fontSize: 11.sp,
                  color: AppColors.textOnCream.withValues(alpha: 0.8),
                ),
                8.heightSpace,
                Icon(
                  section.isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColors.textOnCream,
                  size: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  IconData _getIconForSection(String icon) {
    switch (icon) {
      case 'cafe': return Icons.coffee_outlined;
      case 'museum': return Icons.museum_outlined;
      case 'restaurant': return Icons.restaurant_outlined;
      case 'explore': return Icons.explore_outlined;
      case 'wine_bar': return Icons.wine_bar_outlined;
      case 'hotel': return Icons.hotel_outlined;
      case 'nightlife': return Icons.nightlife_outlined;
      default: return Icons.place_outlined;
    }
  }

  Widget _buildExpandedSection(PlanSection section) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: const BoxDecoration(
        color: AppColors.creamCard,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 4.w,
            children: [
              Icon(Icons.edit_outlined, size: 12.sp, color: Color(0xFF716E66),),
              CustomSecondText(text: "TAP TO SELECT - SWAP FOR ANOTHER", fontSize: 9.sp, color: Color(0xFF716E66),)
            ],
          ),
          16.heightSpace,
          ...section.places.map((place) => _buildPlaceCard(place))
        ],
      ),
    );
  }

  Widget _buildPlaceCard(PlaceSuggestion place) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Color(0xFF2A2F11),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 8.w,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.textHeading,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CustomSecondText(
                  text: place.category,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.background,
                ),
              ),
              Expanded(child: CustomSecondText(text: "◆ GEEYA PARTNER", fontSize: 11.sp, color: Color(0xFFC9A35E))),
              CustomSecondText(text: "9:00am", fontSize: 11.sp, color: Color(0xFF6E695C)),
            ],
          ),
          16.heightSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: place.name,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textHeading,
                    ),
                    if (place.since != null) ...[
                      4.heightSpace,
                      CustomSecondText(
                        text: ("10th · Canal Saint-Martin"),
                        fontSize: 10.sp,
                        color: AppColors.textSubtitle,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          8.heightSpace,
          //CustomSecondText(text: place.subtitle, fontSize: 12.sp, color: AppColors.primary, fontWeight: FontWeight.w600),
          16.heightSpace,

          Container(
            decoration: BoxDecoration(// Even darker shade for quote
              borderRadius: BorderRadius.only(topRight: Radius.circular(8.h), bottomRight:  Radius.circular(8.h)),
              color: AppColors.textWhite.withValues(alpha: 0.05)
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
                            text: place.description,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                            lineHeight: 1.4,
                          ),
                          SizedBox(height: 12.h),
                          CustomText(
                            text: "g.",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          8.heightSpace,
          CustomSecondText(text: "In partnership — Geeya only partners with places it already loves.", fontSize: 8.sp, color: AppColors.textSubtitle),
          20.heightSpace,
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF32381C),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Color(0xFF444A32), width: 1)
            ),
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSecondText(text: "GETTING THERE", fontSize: 8.sp, color: AppColors.sectionLabel,),
                8.heightSpace,
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.w,
                  children: [
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.dividerText,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.textSubtitle, width: 0.3),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 7.h),
                        child: CustomSecondText(text: "UBER", fontSize: 10.sp, color: AppColors.textSubtitle,),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.dividerText,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.textSubtitle, width: 0.3),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 7.h),
                        child: CustomSecondText(text: "TAXI", fontSize: 10.sp, color: AppColors.textSubtitle,),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.dividerText,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.textSubtitle, width: 0.3),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 7.h),
                        child: CustomSecondText(text: "DIRECTIONS", fontSize: 10.sp, color: AppColors.textSubtitle,),
                      ),
                    )
                  ],
                )
              ],
            )
          ),
          12.heightSpace,

          Row(
            spacing: 8.w,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.dividerText,
                      borderRadius: BorderRadius.circular(6.h),
                      border: Border.all(color: AppColors.textSubtitle, width: 0.3),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 12.h),
                    child: CustomSecondText(text: "SELECT", fontSize: 10.sp, color: AppColors.textSubtitle, fontWeight: FontWeight.bold, textAlign: TextAlign.center,),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.dividerText,
                    borderRadius: BorderRadius.circular(8.h),
                    border: Border.all(color: AppColors.textSubtitle, width: 0.3),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
                  child: Icon(Icons.rotate_right_rounded, color: AppColors.textSubtitle,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _placeActionButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderDefault),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: AppColors.textSubtitle, size: 20),
    );
  }

  Widget _buildVisitButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFC5D1D8), // textSubtitle shade
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          CustomSecondText(
            text: "VISIT",
            fontSize: 10.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.background,
            letterSpacing: 1.5,
          ),
          12.widthSpace,
          Icon(Icons.arrow_forward_ios, color: AppColors.background, size: 12),
        ],
      ),
    );
  }
}
