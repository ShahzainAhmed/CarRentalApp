import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app_with_api/app/data/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/data/constants/app_typography.dart';
import 'package:mobile_app_with_api/app/models/car_details_model.dart';

class MyDetailsContainer extends StatefulWidget {
  final Color color;
  final CarDetailsModel carDetailsModel;
  const MyDetailsContainer({
    super.key,
    required this.carDetailsModel,
    required this.color,
  });

  @override
  State<MyDetailsContainer> createState() => MyDetailsContainerState();
}

class MyDetailsContainerState extends State<MyDetailsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 80.w,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            widget.carDetailsModel.icon,
            height: 40.h,
            fit: BoxFit.cover,
          ),
          Text(
            widget.carDetailsModel.text,
            style: AppTypography.kBold12.copyWith(
              color: AppColors.kWhiteColor,
            ),
          )
        ],
      ),
    );
  }
}
