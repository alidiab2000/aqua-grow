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
              title: 'مرحبا بك فى\nAQUA GROW',
              subTitle:
                  "اكتشف مجموعة واسعة من الميزات المفيدة التي تساعدك على تحقيق أهدافك الزراعية بسهولة وفعالية",
            ),
            OnBoardingPage(
              image: "assets/onboarding/onboarding2.png",
              title: "توصيات للرى",
              subTitle:
                  "ستحصل على توصيات مخصصة لأوقات الري والزراعة التي تناسب محاصيلك ، لجعل عملية الزراعة أسهل وأكثر فاعلية",
            ),
            OnBoardingPage(
              image: "assets/onboarding/onboarding3.png",
              title: "مسئول زراعى",
              subTitle:
                  "نوفر لك خدمة الدردشة المباشرة مع مسؤول زراعي مؤهل، للحصول على المساعدة والإرشاد الفوري في جميع مسائل الزراعة الخاصة بك",
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
