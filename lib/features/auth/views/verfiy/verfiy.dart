import 'package:aqua_grow/core/app_routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/verfiy_controller.dart';

class VerfiyView extends StatelessWidget {
  const VerfiyView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifiyController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 65,
                    ),
                    const Image(
                        height: 120,
                        width: 140,
                        image: AssetImage('assets/splash_logos/logo.png')),
                    const Text(
                      'AQUA GROW',
                      style: TextStyle(
                        fontSize: 35,
                        color: Color(0xff3A6431),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'تسجيل الدخول ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'تم التسجيل بنجاح ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff3A6431),
                          ),
                          onPressed: () =>
                              Get.toNamed(AppRoute.navigationMenuPath),
                          child: const Text(
                            'استمرار',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
