import 'package:flutter/material.dart';

import '../../../../../../core/colors/app_colors.dart';
import '../../../../controller/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      right: 16,
      bottom: kBottomNavigationBarHeight,
      child: Container(
        width: 100,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: ElevatedButton(
          onPressed: controller.nextPage,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
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
