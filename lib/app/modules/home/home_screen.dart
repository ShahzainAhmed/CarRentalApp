import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile_app_with_api/app/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/constants/app_typography.dart';
import 'package:mobile_app_with_api/app/models/car_model.dart';
import 'package:mobile_app_with_api/app/modules/detail_screen/detail_screen.dart';
import 'package:mobile_app_with_api/app/modules/home/components/custom_app_bar.dart';
import 'package:mobile_app_with_api/app/modules/home/components/custom_tab_bar.dart';
import 'package:mobile_app_with_api/app/modules/home/components/large_tile.dart';
import 'package:mobile_app_with_api/app/modules/home/components/small_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppColors.kBlackColor,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            const CustomAppBarRow(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Get.height / 1.11,
                decoration: BoxDecoration(
                    color: AppColors.kWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    )),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Available Cars",
                              style: AppTypography.kBold16,
                            ),
                            Text(
                              "View All",
                              style: AppTypography.kBold12.copyWith(
                                  color:
                                      AppColors.kBlackColor.withValues(alpha: 0.5)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      const TabBarWidget(),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 280.h,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 20.w),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: myLargeTileList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FadeInUp(
                                  duration: const Duration(milliseconds: 1500),
                                  child: MyLargeTiles(
                                    onTap: () => Get.to(
                                      DetailScreen(),
                                      arguments: myLargeTileList[index],
                                    ),
                                    largeTileModel: myLargeTileList[index],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "Active Promotions",
                          style: AppTypography.kBold16,
                        ),
                      ),
                      // SizedBox(height: 10.h),
                      SizedBox(
                        height: 130.h,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 20.w),
                          itemCount: mySmallTileList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FadeInUp(
                                  duration: const Duration(milliseconds: 1500),
                                  child: MySmallTile(
                                    onTap: () => Get.to(
                                      DetailScreen(),
                                      arguments: mySmallTileList[index],
                                    ),
                                    carModel: mySmallTileList[index],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
