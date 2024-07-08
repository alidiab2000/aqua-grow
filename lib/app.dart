import 'package:aqua_grow/core/app_routing/app_route.dart';
import 'package:aqua_grow/features/auth/views/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AquaGrow extends StatelessWidget {
  const AquaGrow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('ar'),
      theme: appTheme(),
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
      getPages: AppRoute.routes,
    );
  }

  ThemeData appTheme() {
    return ThemeData().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 243, 240, 240),
    );
  }
}
