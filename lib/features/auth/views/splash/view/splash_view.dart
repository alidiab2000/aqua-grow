import 'package:aqua_grow/core/colors/app_colors.dart';
import 'package:aqua_grow/features/auth/controller/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/splash_logos/1.svg",
              height: 100,
              width: 157,
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              "AQUA GROW",
              style: TextStyle(
                fontSize: 35,
                color: AppColors.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
