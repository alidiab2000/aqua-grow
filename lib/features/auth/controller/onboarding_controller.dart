import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_routing/app_route.dart';
 
class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  // Variables
  final pageController = PageController();
  final currentPageIndex = 0.obs;
  late SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
  }

  // Update Current Index when Page Scroll
  void updatePageIndicator(int index) => currentPageIndex.value = index;

  // Jump to the specific dot selected page
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update current index & Jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      var isFirstTime = "isFirstTime";

      prefs.setBool(isFirstTime, false);
      Get.offAllNamed(AppRoute.loginViewPath);
    } else {
      pageController.jumpToPage(currentPageIndex.value + 1);
    }
  }

  // Update Current Index and Jump To last page
  void skipOnBoarding() {
    var isFirstTime = "isFirstTime";
    prefs.setBool(isFirstTime, false);
    Get.offAllNamed(AppRoute.loginViewPath);
  }
}