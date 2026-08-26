import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mobile_app_with_api/app/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/routes/app_pages.dart';
import 'package:mobile_app_with_api/app/routes/app_routes.dart';

void main() {
  runApp(const CarRentalApp());
}

class CarRentalApp extends StatelessWidget {
  const CarRentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            overscroll: false,
          ),
          debugShowCheckedModeBanner: false,
          title: 'Car Rental App',
          theme: ThemeData(
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: AppColors.kWhiteColor.withValues(alpha: 0.8),
            ),
          ),
          initialRoute: AppRoutes.home,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
