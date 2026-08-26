import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app_with_api/app/constants/app_colors.dart';

import '../../../constants/app_typography.dart';

class MyElevatedButton extends StatelessWidget {
  final Color color;
  const MyElevatedButton({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SizedBox(
        height: 45.h,
        width: double.maxFinite,
        child: Bounce(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.r),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Book Now",
              style:
                  AppTypography.kBold14.copyWith(color: AppColors.kWhiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
