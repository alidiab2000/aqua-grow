import 'package:flutter/material.dart';
import '../../../../controller/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
       right: 16,
      child: TextButton(
        onPressed: controller.skipOnBoarding,
        child: const Text(
          "Skip",
        ),
      ),
    );
  }
}
