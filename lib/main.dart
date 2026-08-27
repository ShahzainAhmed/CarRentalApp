import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mobile_app_with_api/app/constants/app_themes.dart';
import 'package:mobile_app_with_api/app/modules/onboarding/onboarding_screen.dart';
import 'package:mobile_app_with_api/app/routes/app_pages.dart';
import 'package:mobile_app_with_api/app/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();
  final hasSeenOnboarding =
      preferences.getBool(OnboardingScreen.preferenceKey) ?? false;
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(CarRentalApp(showOnboarding: !hasSeenOnboarding));
}

class CarRentalApp extends StatelessWidget {
  const CarRentalApp({super.key, this.showOnboarding = true});

  final bool showOnboarding;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          scrollBehavior:
              const MaterialScrollBehavior().copyWith(overscroll: false),
          debugShowCheckedModeBanner: false,
          title: 'Car Rental App',
          theme: AppThemes.primaryTheme,
          initialRoute: showOnboarding ? AppRoutes.onboarding : AppRoutes.home,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
