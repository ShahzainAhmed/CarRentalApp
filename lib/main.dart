import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mobile_app_with_api/app/data/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/modules/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            overscroll: false,
          ),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: AppColors.kWhiteColor.withOpacity(0.8),
            ),
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
