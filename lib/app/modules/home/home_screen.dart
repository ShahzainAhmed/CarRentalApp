import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile_app_with_api/app/data/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/data/constants/app_typography.dart';
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
                padding: EdgeInsets.only(left: 20.w),
                height: Get.height / 1.1,
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
                        padding: EdgeInsets.only(right: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Available Cars",
                              style: AppTypography.kExtraBold20,
                            ),
                            Text(
                              "View All",
                              style: AppTypography.kBold14,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      const MyCustomTabBar(),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 280.h,
                        child: ListView.separated(
                          padding: EdgeInsets.only(right: 20.w),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 20.w),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: myLargeTileList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyLargeTiles(
                                  onTap: () => Get.to(
                                    DetailScreen(
                                      carModel: myLargeTileList[index],
                                    ),
                                  ),
                                  largeTileModel: myLargeTileList[index],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Active Promotions",
                        style: AppTypography.kExtraBold20,
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 130.h,
                        child: ListView.separated(
                          padding: EdgeInsets.only(right: 20.w),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 20.w),
                          itemCount: mySmallTileList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MySmallTile(
                                  onTap: () => Get.to(DetailScreen(
                                      carModel: mySmallTileList[index])),
                                  carModel: mySmallTileList[index],
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
