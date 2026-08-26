import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app_with_api/app/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/constants/app_typography.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: AppColors.kTransparentColor,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      overlayColor: WidgetStateProperty.all(AppColors.kTransparentColor),
      physics: const BouncingScrollPhysics(),
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      indicatorColor: AppColors.kPrimaryColor,
      labelColor: AppColors.kPrimaryColor,
      unselectedLabelColor: AppColors.kGreyColor,
      labelStyle: AppTypography.kBold14,
      indicatorWeight: 2,
      unselectedLabelStyle: AppTypography.kMedium12,
      labelPadding: EdgeInsets.only(left: 0, right: 24.w),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
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
