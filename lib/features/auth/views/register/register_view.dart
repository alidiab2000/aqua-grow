// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aqua_grow/core/app_routing/app_route.dart';
import 'package:aqua_grow/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:aqua_grow/features/auth/controller/register_controller.dart';

import '../login/widgets/custom_botton.dart';
import 'widget/first_and_last_namse.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
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
                      height: 16,
                    ),
                    const Text(
                      'إنشاء حساب',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Text(
                          'الاسم الاول',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          'الاسم الاخير',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const FirstAndLastName(),
                    FormFieldWithName(
                      name: 'البريد الالكتروني',
                      hintText: 'ادخل البريد الالكتروني',
                      controller: controller.email,
                    ),
                    FormFieldWithName(
                      name: 'كلمة المرور',
                      hintText: 'ادخل كلمة المرور',
                      obscureText: false,
                      controller: controller.password,
                    ),
                    FormFieldWithName(
                      name: 'تاكيد كلمة المرور',
                      hintText: 'تاكيد كلمة المرور',
                      controller: controller.password2,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CustomElvatedButton(
                        text: 'انشاء حساب',
                        onPressed: () =>
                            controller.registerWithEmailAndPassword(),
                        color: AppColors.primaryColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed(AppRoute.loginViewPath),
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: Color(0xff3C9AFB),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
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

class FormFieldWithName extends StatelessWidget {
  const FormFieldWithName({
    super.key,
    required this.name,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  });
  final String name;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff3A6431), width: 2.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff3A6431), width: 2.0),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            suffixIcon: obscureText ? const Icon(Iconsax.eye_slash) : null,
          ),
        ),
      ],
    );
  }
}
