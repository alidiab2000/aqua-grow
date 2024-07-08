import 'package:get/get.dart';

import '../../features/auth/views/on_boarding/view/on_boarding.dart';

class AppRoute {
  static const splashViewPath = '/';
  static const onBoarding = '/onBoarding';
  static const loginViewPath = '/login';
  static final routes = [
    GetPage(
      name: AppRoute.onBoarding,
      page: () => const OnBoardingView(),
    )
  ];
}
