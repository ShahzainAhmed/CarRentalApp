import 'package:get/get.dart';
import 'package:mobile_app_with_api/app/modules/detail_screen/detail_screen.dart';
import 'package:mobile_app_with_api/app/modules/home/home_screen.dart';
import 'package:mobile_app_with_api/app/modules/onboarding/onboarding_screen.dart';

class AppPages {
  static final pages = <GetPage<dynamic>>[
    GetPage(
      name: '/onboarding',
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
    ),
    GetPage(
      name: '/detail',
      page: () => DetailScreen(),
    )
  ];
}
