import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile_app_with_api/app/data/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/data/constants/app_typography.dart';
import 'package:mobile_app_with_api/app/models/car_model.dart';
import 'package:mobile_app_with_api/app/modules/detail_screen/components/bottom_sheet_button.dart';
import 'package:mobile_app_with_api/app/modules/detail_screen/components/details_container.dart';

class DetailScreen extends StatefulWidget {
  final CarModel carModel;
  const DetailScreen({super.key, required this.carModel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          backgroundColor: widget.carModel.color,
          elevation: 0.0,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: const Icon(Icons.menu),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 70.h, horizontal: 20.w),
              height: Get.height / 1.8,
              width: Get.width,
              color: widget.carModel.color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.carModel.title,
                    style: AppTypography.kBold20
                        .copyWith(color: AppColors.kWhiteColor),
                  ),
                  Text(
                    widget.carModel.subtitle,
                    style: AppTypography.kMedium16
                        .copyWith(color: AppColors.kWhiteColor),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        widget.carModel.image,
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
                      physics: const BouncingScrollPhysics(),
                      isScrollable: true,
                      indicatorColor: widget.carModel.color,
                      labelColor: AppColors.kBlackColor,
                      unselectedLabelColor: AppColors.kGreyColor,
                      labelStyle: AppTypography.kBold16,
                      indicatorWeight: 3,
                      labelPadding: EdgeInsets.symmetric(horizontal: 25.w),
                      unselectedLabelStyle: AppTypography.kBold16,
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
                                      itemCount: widget
                                          .carModel.myCarDetailsList.length,
                                      itemBuilder: (context, index) {
                                        return MyDetailsContainer(
                                          color: widget.carModel.color,
                                          carDetailsModel: widget
                                              .carModel.myCarDetailsList[index],
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 30.h),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20.w),
                                    child: Text(
                                      "${widget.carModel.title} is simply dummy text of the printing and typesetting  but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                                      style: AppTypography.kMedium12,
                                      textAlign: TextAlign.justify,
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
        bottomSheet: MyElevatedButton(
          color: widget.carModel.color,
        ),
      ),
    );
  }
}
