import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile_app_with_api/app/data/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/data/constants/app_typography.dart';
import 'package:mobile_app_with_api/app/models/car_model.dart';
import 'package:mobile_app_with_api/app/modules/detail_screen/detail_screen.dart';

class MySmallTile extends StatefulWidget {
  final VoidCallback onTap;
  final CarModel carModel;
  const MySmallTile({super.key, required this.carModel, required this.onTap});

  @override
  State<MySmallTile> createState() => MySmallTileState();
}

class MySmallTileState extends State<MySmallTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.only(top: 5.h, left: 20.w),
        height: 100.h,
        width: 260.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: widget.carModel.color,
          boxShadow: [
            BoxShadow(
              color: AppColors.kGreyColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -70,
              bottom: -13,
              child: SizedBox(
                height: 100.h,
                child: Image.asset(
                  widget.carModel.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180.w,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Take any ",
                          style: AppTypography.kMedium14
                              .copyWith(color: AppColors.kWhiteColor),
                        ),
                        TextSpan(
                          text: widget.carModel.carMake,
                          style: AppTypography.kExtraBold14
                              .copyWith(color: AppColors.kWhiteColor),
                        ),
                        TextSpan(
                          text: " one day for free",
                          style: AppTypography.kMedium14
                              .copyWith(color: AppColors.kWhiteColor),
                        ),
                      ],
                    ),
                  ),
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                    ),
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                  onPressed: () =>
                      Get.to(DetailScreen(carModel: widget.carModel)),
                  child: Text(
                    "View Details",
                    style: AppTypography.kMedium12
                        .copyWith(color: AppColors.kWhiteColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
