import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/common/widgets/custom_text.dart';
import '../../../../../core/common/widgets/custom_second_text.dart';
import '../../../../../core/common/widgets/custom_textformfield.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../controllers/discover_controller.dart';
import '../../domain/entities/destination.dart';

class DiscoverScreen extends GetView<DiscoverController> {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header, search, chips, filters, section label + view toggle
            SliverPadding(
              padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSecondText(
                      text: "--- EXPLORE • GUIDES • PLACES",
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSubtitle,
                    ),
                    10.heightSpace,
                    CustomText(
                      text: "Pick where you go",
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    4.heightSpace,
                    CustomSecondText(
                      text: "Search a city, a place, or the kind of day you want.",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextFormField(
                      controller: controller.searchController,
                      hintText: "Search destinations",
                      prefixIcon: const Icon(Icons.search, color: AppColors.textMuted, size: 18),
                      containerColor: AppColors.surface,
                      borderRedius: 100,
                      onFieldSubmitted: (v) {},
                      containerBorderColor: AppColors.borderSubtle,
                      hintTextStyle: const TextStyle(color: AppColors.textMuted),
                    ),
                    SizedBox(height: 16.h),
                    _buildCategoryChips(),
                    SizedBox(height: 14.h),
                    CustomSecondText(
                      text: "FILTERS",
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.sectionLabel,
                      letterSpacing: 2.2,
                    ),
                    8.heightSpace,
                    _buildFilterChips(),
                    12.heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSecondText(
                          text: "DESTINATIONS",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.sectionLabel,
                          letterSpacing: 2.2,
                        ),
                        _buildViewToggle(),
                      ],
                    ),
                    16.heightSpace,
                  ],
                ),
              ),
            ),

            // Destinations: loading / grid / list (all slivers)
            SliverPadding(
              padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
              sliver: Obx(() {
                if (controller.isLoading.value) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 48.h),
                      child: const Center(
                        child: CircularProgressIndicator(color: AppColors.primary),
                      ),
                    ),
                  );
                }
                return controller.isGridView.value
                    ? _buildSliverGrid()
                    : _buildSliverList();
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 38.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 4.w),
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return Obx(() {
            final isSelected = controller.selectedCategory.value == category;
            return GestureDetector(
              onTap: () => controller.selectCategory(category),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: isSelected ? AppColors.primary : AppColors.borderSubtle),
                ),
                child: CustomSecondText(
                  text: "$category ▾",
                  fontSize: 13,
                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 38.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.filters.length,
        separatorBuilder: (context, index) => SizedBox(width: 4.w),
        itemBuilder: (context, index) {
          final category = controller.filters[index];
          return Obx(() {
            final isSelected = controller.selectedFilter.value == category;
            return GestureDetector(
              onTap: () => controller.selectCategory(category),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: isSelected ? AppColors.primary : AppColors.borderSubtle),
                ),
                child: CustomSecondText(
                  text: "$category ▾",
                  fontSize: 13,
                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildViewToggle() {
    return Obx(() => Container(
      width: 64.w,
      height: 30.h,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColors.toggleBg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Row(
        children: [
          _toggleItem(Icons.grid_view, controller.isGridView.value, () => controller.isGridView.value = true),
          _toggleItem(Icons.list, !controller.isGridView.value, () => controller.isGridView.value = false),
        ],
      ),
    ));
  }

  Widget _toggleItem(IconData icon, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 29.w,
        height: 24.h,
        decoration: BoxDecoration(
          color: isActive ? AppColors.textSubtitle : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 16, color: isActive ? AppColors.surface : AppColors.textSubtitle),
      ),
    );
  }

  Widget _buildSliverGrid() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 101 / 160,
      ),
      delegate: SliverChildBuilderDelegate(
            (context, index) => _DestinationCard(
          destination: controller.destinations[index],
          isGrid: true,
        ),
        childCount: controller.destinations.length,
      ),
    );
  }

  Widget _buildSliverList() {
    return SliverList.separated(
      itemCount: controller.destinations.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) => _DestinationCard(
        destination: controller.destinations[index],
        isGrid: false,
      ),
    );
  }
}

class _DestinationCard extends StatelessWidget {
  final Destination destination;
  final bool isGrid;

  const _DestinationCard({required this.destination, required this.isGrid});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: isGrid ? 101.w : double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderDefault),
        image: DecorationImage(
          image: NetworkImage(destination.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8.h,
            left: 8.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: destination.city,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textHeading,
                ),
                CustomSecondText(
                  text: destination.country,
                  fontSize: 7.5,
                  fontWeight: FontWeight.w700,
                  color: AppColors.lavenderText,
                  letterSpacing: 0.75,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}