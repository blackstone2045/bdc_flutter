import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geeya_travel_management/core/utils/constants/app_sizer.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/image_path.dart';

class CircularProfilePicture extends StatelessWidget {
  const CircularProfilePicture({super.key, required this.imageLink,this.radius, this.backgroundColor, this.padding});

  final String? imageLink;
  final double? radius;
  final double? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 24.h,
      backgroundColor: backgroundColor ?? AppColors.primary,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding ?? 2.w, vertical: padding ?? 2.h),
        child: ClipOval(
            child: imageLink == null || imageLink == "" ?
            Image.asset(ImagePath.dummyProfilePicture, fit: BoxFit.fitHeight, height: double.infinity, width: double.infinity,) :
            !imageLink!.contains("http") ?
            Image.file(
              File(imageLink!), fit: BoxFit.fitHeight, height: double.infinity, width: double.infinity,
              errorBuilder: (context, o, s){
                return Image.asset(ImagePath.dummyProfilePicture, fit: BoxFit.fitHeight, height: double.infinity, width: double.infinity,);
              },
            ) :
            FadeInImage.assetNetwork(
              placeholder: ImagePath.dummyProfilePicture,
              placeholderFit: BoxFit.fitHeight,
              image: imageLink!, fit: BoxFit.fitHeight, height: double.infinity, width: double.infinity,
              imageErrorBuilder: (context, o, s){
                return Image.asset(ImagePath.dummyProfilePicture, fit: BoxFit.fitHeight, height: double.infinity, width: double.infinity,);
              },
            )
        ),
      ),
    );
  }
}
