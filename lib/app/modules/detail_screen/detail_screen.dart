import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile_app_with_api/app/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/constants/app_typography.dart';
import 'package:mobile_app_with_api/app/models/car_model.dart';
import 'package:mobile_app_with_api/app/modules/detail_screen/components/bottom_sheet_button.dart';
import 'package:mobile_app_with_api/app/modules/detail_screen/components/details_container.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carModel = Get.arguments as CarModel;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.kWhiteColor,
            ),
          ),
          backgroundColor: carModel.color,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 90.h, horizontal: 20.w),
              height: Get.height / 1.7,
              width: Get.width,
              color: carModel.color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    carModel.title,
                    style: AppTypography.kBold20
                        .copyWith(color: AppColors.kWhiteColor),
                  ),
                  Text(
                    carModel.price,
                    style: AppTypography.kMedium16
                        .copyWith(color: AppColors.kWhiteColor),
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        carModel.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Get.height / 2.0,
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    TabBar(
                      dividerColor: AppColors.kTransparentColor,
                      tabAlignment: TabAlignment.center,
                      overlayColor:
                          WidgetStateProperty.all(AppColors.kTransparentColor),
                      physics: const BouncingScrollPhysics(),
                      isScrollable: true,
                      indicatorColor: carModel.color,
                      labelColor: AppColors.kBlackColor,
                      unselectedLabelColor: AppColors.kGreyColor,
                      labelStyle: AppTypography.kBold16,
                      indicatorWeight: 3,
                      labelPadding: EdgeInsets.symmetric(horizontal: 25.w),
                      unselectedLabelStyle: AppTypography.kMedium14,
                      tabs: const [
                        Tab(text: "Details"),
                        Tab(text: "Specs"),
                        Tab(text: "Photos"),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  SizedBox(height: 30.h),
                                  SizedBox(
                                    height: 80.h,
                                    child: ListView.separated(
                                      padding: EdgeInsets.only(right: 20.w),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(width: 15.w),
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          carModel.myCarDetailsList.length,
                                      itemBuilder: (context, index) {
                                        return MyDetailsContainer(
                                          color: carModel.color,
                                          carDetailsModel:
                                              carModel.myCarDetailsList[index],
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 30.h),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20.w),
                                    child: Text(
                                      carModel.description,
                                      style: AppTypography.kMedium12,
                                      // textAlign: TextAlign.justify,
                                    ),
                                  ),
                                  SizedBox(height: 120.h),
                                ],
                              ),
                            ),
                            const Text("Specs"),
                            const Text("Photos"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomSheet: MyElevatedButton(color: carModel.color),
      ),
    );
  }
}
