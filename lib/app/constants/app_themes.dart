import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app_with_api/app/constants/app_colors.dart';

class AppThemes {
  static ThemeData primaryTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.kWhiteColor.withValues(alpha: 0.8),
    ),
  );
}

SystemUiOverlayStyle defaultOverlay = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  systemStatusBarContrastEnforced: true,
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.white,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);
