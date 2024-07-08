import 'package:aqua_grow/core/app_routing/app_route.dart';
import 'package:aqua_grow/features/auth/controller/login_controller.dart';
import 'package:aqua_grow/features/auth/views/login/widgets/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'البريد الالكتروني',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller.emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff3A6431), width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff3A6431), width: 2.0),
              ),
              hintText: 'ادخل البريد الالكتروني',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'كلمة المرور',
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: ''),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller.passwordController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff3A6431), width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff3A6431), width: 2.0),
                ),
                hintText: 'ادخل كلمة المرور',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),
          const SizedBox(height: 12),
          TextButton(
              onPressed: () {},
              child: const Text(
                'نسيت كلمة المرور؟',
                style: TextStyle(
                  color: Color(0xff3C9AFB),
                  fontStyle: FontStyle.italic,
                ),
              )),
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomElvatedButton(
                text: 'تسجيل الدخول',
                color: Color(0xff3A6431),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'هل لديك حساب ؟',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextButton(
                onPressed: () => Get.toNamed(AppRoute.registerViewPath),
                child: const Text(
                  'انشاء حساب الان',
                  style: TextStyle(color: Color(0xff3A6431)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
