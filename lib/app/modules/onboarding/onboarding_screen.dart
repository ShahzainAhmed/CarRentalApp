import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_app_with_api/app/constants/app_assets.dart';
import 'package:mobile_app_with_api/app/constants/app_colors.dart';
import 'package:mobile_app_with_api/app/constants/app_typography.dart';
import 'package:mobile_app_with_api/app/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String preferenceKey = 'has_seen_onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isFinishing = false;

  static final List<_OnboardingPage> _pages = [
    _OnboardingPage(
      eyebrow: 'YOUR RIDE • YOUR RULES',
      title: 'Find your perfect ride',
      description:
          'From quick city trips to weekend escapes, choose a car that fits the moment.',
      carName: 'Renault Clio',
      price: r'$ 60 / day',
      image: AppAssets.kCar1,
      color: AppColors.kPrimaryColor,
    ),
    _OnboardingPage(
      eyebrow: 'CLEAR • QUICK • SIMPLE',
      title: 'Simple choices, clear prices',
      description:
          'Compare cars at a glance and know what you will pay before you book.',
      carName: 'Peugeot 107',
      price: r'$ 55 / day',
      image: AppAssets.kCar4,
      color: AppColors.kPurpleColor,
    ),
    _OnboardingPage(
      eyebrow: 'BOOK • PICK UP • DRIVE',
      title: 'Get on the road faster',
      description:
          'A smooth rental experience designed to take you from browsing to driving in just a few taps.',
      carName: 'Volkswagen Polo',
      price: r'$ 45 / day',
      image: AppAssets.kCar2,
      color: AppColors.kOrangeColor,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _finishOnboarding() async {
    if (_isFinishing) return;

    setState(() => _isFinishing = true);

    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(OnboardingScreen.preferenceKey, true);

    if (!mounted) return;
    Get.offAllNamed(AppRoutes.home);
  }

  void _handlePrimaryAction() {
    if (_currentPage == _pages.length - 1) {
      _finishOnboarding();
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final heroHeight = mediaQuery.size.height * 0.60;
    final currentPage = _pages[_currentPage];

    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            color: AppColors.kBlackColor,
          ),
          Column(
            children: [
              SizedBox(
                height: heroHeight,
                child: Stack(
                  children: [
                    Positioned(
                      top: mediaQuery.padding.top + 14.h,
                      left: 24.w,
                      right: 24.w,
                      child: _TopBar(onSkip: _finishOnboarding),
                    ),
                    Positioned.fill(
                      top: mediaQuery.padding.top + 66.h,
                      child: PageView.builder(
                        controller: _pageController,
                        physics: const BouncingScrollPhysics(),
                        itemCount: _pages.length,
                        onPageChanged: (index) {
                          setState(() => _currentPage = index);
                        },
                        itemBuilder: (context, index) {
                          return _CarHero(
                            page: _pages[index],
                            index: index,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(
                    24.w,
                    28.h,
                    24.w,
                    mediaQuery.padding.bottom + 18.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.kWhiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34.r),
                      topRight: Radius.circular(34.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _ProgressIndicator(
                        currentPage: _currentPage,
                        pageCount: _pages.length,
                        activeColor: currentPage.color,
                      ),
                      SizedBox(height: 22.h),
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 280),
                          switchInCurve: Curves.easeOut,
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0.05, 0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              ),
                            );
                          },
                          child: _OnboardingCopy(
                            key: ValueKey(_currentPage),
                            page: currentPage,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 56.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isFinishing ? null : _handlePrimaryAction,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: currentPage.color,
                            disabledBackgroundColor:
                                currentPage.color.withValues(alpha: 0.65),
                            foregroundColor: AppColors.kWhiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 180),
                            child: _isFinishing
                                ? SizedBox(
                                    key: const ValueKey('loading'),
                                    height: 20.h,
                                    width: 20.h,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.kWhiteColor,
                                    ),
                                  )
                                : Row(
                                    key: ValueKey(_currentPage),
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _currentPage == _pages.length - 1
                                            ? 'Start Exploring'
                                            : 'Next',
                                        style: AppTypography.kBold16.copyWith(
                                          color: AppColors.kWhiteColor,
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      const Icon(
                                        Icons.arrow_forward_rounded,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onSkip});

  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 38.h,
          width: 38.h,
          decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: const Icon(
            Icons.directions_car_filled_rounded,
            color: AppColors.kWhiteColor,
            size: 21,
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          'Car Rental',
          style: AppTypography.kBold16.copyWith(
            color: AppColors.kWhiteColor,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: onSkip,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.kWhiteColor,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          ),
          child: Text(
            'Skip',
            style: AppTypography.kMedium14.copyWith(
              color: AppColors.kWhiteColor.withValues(alpha: 0.76),
            ),
          ),
        ),
      ],
    );
  }
}

class _CarHero extends StatelessWidget {
  const _CarHero({required this.page, required this.index});

  final _OnboardingPage page;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 12.h,
                right: -70.w,
                child: Container(
                  height: 210.w,
                  width: 210.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: page.color.withValues(alpha: 0.35),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -48.w,
                bottom: 12.h,
                child: Container(
                  height: 124.w,
                  width: 124.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: page.color.withValues(alpha: 0.13),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: constraints.maxHeight * 0.74,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(22.w, 20.h, 22.w, 10.h),
                  decoration: BoxDecoration(
                    color: page.color,
                    borderRadius: BorderRadius.circular(30.r),
                    boxShadow: [
                      BoxShadow(
                        color: page.color.withValues(alpha: 0.25),
                        blurRadius: 30,
                        offset: const Offset(0, 16),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          height: 38.h,
                          width: 38.h,
                          decoration: BoxDecoration(
                            color:
                                AppColors.kWhiteColor.withValues(alpha: 0.18),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  AppColors.kWhiteColor.withValues(alpha: 0.28),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '0${index + 1}',
                              style: AppTypography.kBold12.copyWith(
                                color: AppColors.kWhiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            page.eyebrow,
                            style: AppTypography.kBold10.copyWith(
                              color:
                                  AppColors.kWhiteColor.withValues(alpha: 0.78),
                              letterSpacing: 1.1,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            page.carName,
                            style: AppTypography.kBold22.copyWith(
                              color: AppColors.kWhiteColor,
                            ),
                          ),
                          Text(
                            page.price,
                            style: AppTypography.kMedium16.copyWith(
                              color: AppColors.kWhiteColor,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Transform.translate(
                                offset: Offset(10.w, 14.h),
                                child: Image.asset(
                                  page.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _OnboardingCopy extends StatelessWidget {
  const _OnboardingCopy({super.key, required this.page});

  final _OnboardingPage page;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          page.title,
          style: AppTypography.kBold30.copyWith(
            color: AppColors.kBlackColor,
            height: 1.1,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          page.description,
          style: AppTypography.kMedium12.copyWith(
            color: AppColors.kGreyColor,
            height: 1.55,
          ),
        ),
      ],
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator({
    required this.currentPage,
    required this.pageCount,
    required this.activeColor,
  });

  final int currentPage;
  final int pageCount;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(pageCount, (index) {
        final isCurrent = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOut,
          height: 5.h,
          width: isCurrent ? 28.w : 8.w,
          margin: EdgeInsets.only(right: 7.w),
          decoration: BoxDecoration(
            color: isCurrent
                ? activeColor
                : AppColors.kLightGrey.withValues(alpha: 0.95),
            borderRadius: BorderRadius.circular(20.r),
          ),
        );
      }),
    );
  }
}

class _OnboardingPage {
  const _OnboardingPage({
    required this.eyebrow,
    required this.title,
    required this.description,
    required this.carName,
    required this.price,
    required this.image,
    required this.color,
  });

  final String eyebrow;
  final String title;
  final String description;
  final String carName;
  final String price;
  final String image;
  final Color color;
}
