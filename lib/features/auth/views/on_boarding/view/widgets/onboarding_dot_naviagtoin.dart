import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../../../../controller/onboarding_controller.dart';

class OnBoardingBotNavigation extends StatelessWidget {
  const OnBoardingBotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: kBottomNavigationBarHeight + 25,
      right: 16,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: (index) {
          controller.dotNavigationClick(index);
        },
        count: 3,
        effect: const ExpandingDotsEffect(
          activeDotColor: AppColors.primaryColor,
          dotHeight: 10,
        ),
      ),
    );
  }
}
