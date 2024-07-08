import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/onboarding_controller.dart';
import 'onboarding_dot_naviagtoin.dart';
import 'onboarding_next_button.dart';
import 'onboarding_page.dart';
import 'onboarding_skip.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Stack(
      children: [
        PageView(
          onPageChanged: controller.updatePageIndicator,
          controller: controller.pageController,
          children: const [
            OnBoardingPage(
              image: "assets/onboarding/onboarding1.png",
              title: 'AQUA GROWمرحبا بك فى',
              subTitle:
                  "اكتشف مجموعة واسعة من الميزات المفيدة التي تساعدك على تحقيق أهدافك الزراعية بسهولة وفعالية",
            ),
          ],
        ),
        const OnBoardingSkip(),
        const OnBoardingBotNavigation(),
        const OnBoardingNextButton()
      ],
    );
  }
}
