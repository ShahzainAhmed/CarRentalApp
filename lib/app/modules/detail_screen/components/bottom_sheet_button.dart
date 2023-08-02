import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app_with_api/app/data/constants/app_colors.dart';

import '../../../data/constants/app_typography.dart';

class MyElevatedButton extends StatelessWidget {
  final Color color;
  const MyElevatedButton({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h, top: 10.h),
      child: SizedBox(
        height: 40.h,
        width: double.maxFinite,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.r),
            ),
          ),
          onPressed: () {},
          child: Text(
            "BOOK NOW",
            style: AppTypography.kBold18.copyWith(color: AppColors.kWhiteColor),
          ),
        ),
      ),
    );
  }
}
