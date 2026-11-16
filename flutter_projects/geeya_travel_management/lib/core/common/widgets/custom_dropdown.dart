import 'package:flutter/material.dart';
import 'custom_second_text.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_sizer.dart';

class CustomDropdownField extends StatelessWidget {
  final GlobalKey _menuKey = GlobalKey();

  CustomDropdownField({
    super.key,
    this.label,
    this.radius,
    required this.hintText,
    this.withAsterisk = false,
    required this.items,
    required this.selectedValue,
    this.selectedItemColor,
    this.borderColor,
    required this.onChanged,
    this.selectedBackgroundColor,
  });

  final String? label;
  final String hintText;
  final bool withAsterisk;
  final List<String> items;
  final String selectedValue;
  final Color? borderColor;
  final double? radius;
  final ValueChanged<String> onChanged;
  final Color? selectedItemColor;
  final Color? selectedBackgroundColor;

  void _openMenu() {
    final dynamic state = _menuKey.currentState;
    state.showButtonMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _openMenu,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 12),
              border: Border.all(
                color: borderColor ?? AppColors.borderDefault,
                width: 1,
              ),
              color: AppColors.surface,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomSecondText(
                    text: selectedValue.isEmpty ? hintText : selectedValue,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: selectedValue.isEmpty
                        ? AppColors.textPlaceholder
                        : AppColors.textPrimary,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
                PopupMenuButton<String>(
                  key: _menuKey,
                  color: AppColors.surface,
                  onSelected: onChanged,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: AppColors.borderDefault),
                  ),
                  offset: Offset(0, 48.h),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: AppColors.textPrimary,
                  ),
                  itemBuilder: (context) {
                    return items.map((item) {
                      return PopupMenuItem<String>(
                        value: item,
                        child: CustomSecondText(
                          text: item,
                          fontSize: 14,
                          fontWeight: selectedValue == item
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: selectedValue == item
                              ? AppColors.primary
                              : AppColors.textPrimary,
                        ),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
