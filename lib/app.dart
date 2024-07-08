import 'package:aqua_grow/features/auth/views/on_boarding/view/on_boarding.dart';
import 'package:flutter/material.dart';

class AquaGrow extends StatelessWidget {
  const AquaGrow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      theme: appTheme(),
      home: const OnBoardingView(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData appTheme() {
    return ThemeData().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 243, 240, 240),
    );
  }
}
