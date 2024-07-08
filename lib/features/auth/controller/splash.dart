import 'package:get/get.dart';

import '../../../core/app_routing/app_route.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoute.onBoarding);  // Get.toNamed(AppRoute.onBoarding);
    });
  }
}
