import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app_with_api/app/data/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/data/constants/app_typography.dart';

class MyCustomTabBar extends StatelessWidget {
  const MyCustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      physics: const BouncingScrollPhysics(),
      isScrollable: true,
      indicatorColor: AppColors.kPrimaryColor,
      labelColor: AppColors.kPrimaryColor,
      unselectedLabelColor: AppColors.kGreyColor,
      labelStyle: AppTypography.kBold14,
      indicatorWeight: 2,
      labelPadding: EdgeInsets.symmetric(horizontal: 15.w),
      unselectedLabelStyle: AppTypography.kBold14,
      tabs: const [
        Tab(text: "All"),
        Tab(text: "Sedan"),
        Tab(text: "SUV"),
        Tab(text: "Hatchback"),
        Tab(text: "Crossover"),
      ],
    );
  }
}
