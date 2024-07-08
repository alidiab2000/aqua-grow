import 'package:flutter/material.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../../../../controller/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      left: 16,
      bottom: kBottomNavigationBarHeight,
      child: SizedBox(
        width: 100,
        child: ElevatedButton(
          onPressed: controller.nextPage,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
          ),
          child: const Text(
            "التالي",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
