import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile_app_with_api/app/data/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/data/constants/app_typography.dart';

class CustomAppBarRow extends StatelessWidget {
  const CustomAppBarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 9,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            const Icon(
              Icons.pin_drop_rounded,
              color: AppColors.kWhiteColor,
            ),
            SizedBox(width: 10.w),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Barcelona, ',
                  style: AppTypography.kBold16
                      .copyWith(color: AppColors.kWhiteColor),
                ),
                TextSpan(
                  text: 'Spain',
                  style: AppTypography.kMedium16
                      .copyWith(color: AppColors.kPrimaryColor),
                ),
              ]),
            ),
            const Spacer(),
            const Icon(Icons.menu, color: AppColors.kWhiteColor),
          ],
        ),
      ),
    );
  }
}
