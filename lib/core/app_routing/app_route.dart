import 'package:aqua_grow/features/auth/views/verfiy/verfiy.dart';
import 'package:aqua_grow/features/presonal/view/navigation_menu/navigation_menu.dart';
import 'package:get/get.dart';

import '../../features/auth/views/login/login.dart';
import '../../features/auth/views/on_boarding/view/on_boarding.dart';
import '../../features/auth/views/register/register_view.dart';

class AppRoute {
  static const splashViewPath = '/';
  static const onBoarding = '/onBoarding';
  static const loginViewPath = '/login';
  static const registerViewPath = '/register';
  static const verifyViewPath = '/verify';

  static const navigationMenuPath = '/navigationMenu';
  static final routes = [
    GetPage(
      name: AppRoute.onBoarding,
      page: () => const OnBoardingView(),
    ),
    GetPage(
      name: AppRoute.loginViewPath,
      page: () => const LoginView(),
    ),
    GetPage(
      name: AppRoute.registerViewPath,
      page: () => const RegisterView(),
    ),
    GetPage(
      name: AppRoute.verifyViewPath,
      page: () => const VerfiyView(),
    ),
    GetPage(
      name: AppRoute.navigationMenuPath,
      page: () => const NavigationMenu(),
    ),
  ];
}
