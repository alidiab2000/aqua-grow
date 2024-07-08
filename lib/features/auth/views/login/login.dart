import 'package:flutter/material.dart';

import 'widgets/form_section.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 65,
                    ),
                    Image(
                        height: 120,
                        width: 140,
                        image: AssetImage('assets/splash_logos/logo.png')),
                    Text(
                      'AQUA GROW',
                      style: TextStyle(
                        fontSize: 35,
                        color: Color(0xff3A6431),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'تسجيل الدخول ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
              ),
              const FormSection(),
            ],
          ),
        ),
      ),
    );
  }
}
