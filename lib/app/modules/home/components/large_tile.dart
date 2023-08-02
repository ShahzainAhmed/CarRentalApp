import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app_with_api/app/data/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/data/constants/app_typography.dart';
import 'package:mobile_app_with_api/app/models/car_model.dart';

class MyLargeTiles extends StatefulWidget {
  final VoidCallback onTap;
  final CarModel largeTileModel;
  const MyLargeTiles(
      {super.key, required this.largeTileModel, required this.onTap});

  @override
  State<MyLargeTiles> createState() => MyLargeTilesState();
}

class MyLargeTilesState extends State<MyLargeTiles> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.only(top: 15.h, left: 20.w),
        height: 250.h,
        width: 230.w,
        decoration: BoxDecoration(
          color: widget.largeTileModel.color,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.kGreyColor.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: -20,
              top: 40,
              child: SizedBox(
                height: 170.h,
                child: Image.asset(
                  widget.largeTileModel.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.largeTileModel.title,
                  style: AppTypography.kBold20
                      .copyWith(color: AppColors.kWhiteColor),
                ),
                Text(
                  widget.largeTileModel.subtitle,
                  style: AppTypography.kMedium16
                      .copyWith(color: AppColors.kWhiteColor),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Details",
                      style: AppTypography.kBold16
                          .copyWith(color: AppColors.kWhiteColor),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 28.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: AppColors.kWhiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Text(
                        "Rent Now",
                        style: AppTypography.kExtraBold16
                            .copyWith(color: widget.largeTileModel.color),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
