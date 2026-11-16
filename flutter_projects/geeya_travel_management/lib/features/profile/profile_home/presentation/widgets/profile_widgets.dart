import 'package:flutter/material.dart';
import 'package:geeya_travel_management/core/common/widgets/custom_text.dart';
import 'package:get/get.dart';
import '../../../../../../core/common/widgets/custom_second_text.dart';
import '../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../core/utils/constants/app_sizer.dart';
import '../controllers/profile_home_controller.dart';

class DottedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.creamCard
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const double dashWidth = 4;
    const double dashSpace = 6;
    final double radius = size.width / 2;
    final double circumference = 2 * 3.14159 * radius;
    final int dashCount = (circumference / (dashWidth + dashSpace)).floor();

    for (int i = 0; i < dashCount; i++) {
      final double angle = (i * (dashWidth + dashSpace) / circumference) * 2 * 3.14159;
      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        angle,
        dashWidth / circumference * 2 * 3.14159,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ProfileHeader extends StatelessWidget {
  final ProfileHomeController controller;
  const ProfileHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(110.h, 110.h),
              painter: DottedCirclePainter(),
            ),
            Container(
              height: 90.h,
              width: 90.h,
              decoration: BoxDecoration(
                color: Color(0xFF1F240C), // Surface olive
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.creamCard, width: 2),
              ),
              alignment: Alignment.center,
              child: Obx(() => CustomText(
                    text: controller.userName.value.isNotEmpty
                        ? controller.userName.value.substring(0, 1).toUpperCase()
                        : "",
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.creamCard,
                  )),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Obx(() => CustomText(
              text: "Hi, ${controller.userName.value}",
                fontSize: 32.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.creamCard,
            )),
        SizedBox(height: 8.h),
        CustomSecondText(
          text: "COLLECT MOMENTS WORLDWIDE.",
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.creamCard,
          letterSpacing: 1.2,
        ),
      ],
    );
  }
}

class StatGrid extends StatelessWidget {
  final ProfileHomeController controller;
  const StatGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _StatTile(label: "COUNTRIES", value: controller.countries)),
            SizedBox(width: 8.w),
            Expanded(child: _StatTile(label: "CITIES", value: controller.cities)),
            SizedBox(width: 8.w),
            Expanded(child: _StatTile(label: "TRIPS", value: controller.trips)),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(child: _StatTile(label: "HOTELS", value: controller.hotels)),
            SizedBox(width: 8.w),
            Expanded(child: _StatTile(label: "FLIGHTS", value: controller.flights)),
            SizedBox(width: 8.w),
            Expanded(child: _StatTile(label: "KM WALKED", value: controller.kmWalked)),
          ],
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final dynamic value;
  const _StatTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.creamCard,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => CustomText(
                text: value.value.toString(),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textOnCream,
              )),
          SizedBox(height: 4.h),
          CustomSecondText(
            text: label,
            fontSize: 8.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textOnCream.withValues(alpha: 0.6),
          ),
        ],
      ),
    );
  }
}

class VaultGrid extends StatelessWidget {
  const VaultGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final vaultItems = [
      {'title': "Boarding Passes", 'subtitle': '11 cards', 'icon': Icons.airplane_ticket_outlined},
      {'title': "Transport", 'subtitle': '22 items', 'icon': Icons.train_outlined},
      {'title': "Hotels", 'subtitle': '9 stays', 'icon': Icons.hotel_outlined},
      {'title': "Documents", 'subtitle': '14 files', 'icon': Icons.description_outlined},
      {'title': "Packing", 'subtitle': '4 lists', 'icon': Icons.shopping_bag_outlined},
      {'title': "Itineraries", 'subtitle': '8 trips', 'icon': Icons.map_outlined},
      {'title': "Expenses", 'subtitle': '1.2k spent', 'icon': Icons.receipt_long_outlined},
      {'title': "Memories", 'subtitle': '554 photos', 'icon': Icons.explore_outlined},
      {'title': "Postcards", 'subtitle': '12 mails', 'icon': Icons.file_upload_outlined}
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSecondText(
          text: "THE VAULT",
          fontSize: 10.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.creamCard,
          letterSpacing: 2.2,
        ),
        SizedBox(height: 16.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 1.5,
          ),
          itemCount: vaultItems.length,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: AppColors.creamCard,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 4.h,
              children: [
                Icon(vaultItems[index]['icon'] as IconData, color: AppColors.deepPrimary, size: 20.h),
                CustomSecondText(
                  text: vaultItems[index]['title'] as String,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textOnCream,
                ),
                CustomSecondText(
                  text: vaultItems[index]['subtitle'] as String,
                  fontSize: 8.sp,
                  color: AppColors.textOnCream.withValues(alpha: 0.6),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CollectionSection extends StatelessWidget {
  final ProfileHomeController controller;
  const CollectionSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSecondText(
              text: "COLLECTIONS",
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.creamCard,
              letterSpacing: 2.2,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "new",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSubtitle,
                ),
                Icon(Icons.arrow_right_alt_outlined, color: AppColors.textSubtitle,)
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 120.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _CollectionCard(
                title: "Cafes I'd fly back for",
                subtitle: "4 SAVED • PRIVATE",
                gradient: const [Color(0xFF8B7053), Color(0xFF4A3C2A)],
              ),
              SizedBox(width: 12.w),
              _CollectionCard(
                title: "Favorite sunsets",
                subtitle: "9 SAVED • PRIVATE",
                gradient: const [Color(0xFF9E6359), Color(0xFF5A352F)],
              ),
              SizedBox(width: 12.w),
              _CollectionCard(
                title: "Best bars",
                subtitle: "3 SAVED • PRIVATE",
                gradient: const [Color(0xFF5D6B53), Color(0xFF333E2A)],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CollectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Color> gradient;
  const _CollectionCard({required this.title, required this.subtitle, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.h),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.h),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppColors.textBlack,
              Colors.transparent,
              Colors.transparent,
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textWhite,
            ),
            SizedBox(height: 4.h),
            CustomSecondText(
              text: subtitle,
              fontSize: 8.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountSection extends StatelessWidget {
  final String title;
  final List<AccountRowData> items;
  const AccountSection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSecondText(
          text: title,
          fontSize: 10.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.creamCard,
          letterSpacing: 2.2,
        ),
        SizedBox(height: 16.h),
        ...items.map((item) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: _AccountRow(data: item),
            )),
      ],
    );
  }
}

class AccountRowData {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final Color? iconColor;
  final String? detail;
  final IconData? leadingIcon;
  AccountRowData({required this.title, required this.onTap, this.color, this.detail, this.leadingIcon, this.iconColor});
}

class _AccountRow extends StatelessWidget {
  final AccountRowData data;
  const _AccountRow({required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: data.onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 52.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.creamCard,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            if (data.leadingIcon != null) ...[
              Icon(data.leadingIcon, color: data.iconColor ?? data.color ?? AppColors.textOnCream, size: 20.h),
              SizedBox(width: 12.w),
            ],
            Expanded(
              child: CustomText(
                text: data.title,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: data.color ?? AppColors.textOnCream,
              ),
            ),
            if (data.detail != null)
              CustomSecondText(
                text: data.detail!,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.textOnCream.withValues(alpha: 0.6),
                textAlign: TextAlign.right,
              ),
            SizedBox(width: 8.w),
            Icon(Icons.chevron_right, color: AppColors.textOnCream.withValues(alpha: 0.3), size: 20.h),
          ],
        ),
      ),
    );
  }
}
