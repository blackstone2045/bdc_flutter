import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geeya_travel_management/core/utils/constants/app_sizer.dart';

import '../../utils/constants/app_colors.dart';


class ShowProgressIndicator extends StatelessWidget {
  const ShowProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWave(
        color: AppColors.primary,
        size: 30.h,
      ),
    );
  }
}
