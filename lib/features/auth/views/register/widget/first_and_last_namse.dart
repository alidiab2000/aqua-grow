import 'package:aqua_grow/features/auth/controller/register_controller.dart';
import 'package:flutter/material.dart';

class FirstAndLastName extends StatelessWidget {
  const FirstAndLastName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = RegisterController.instance;
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller.firstName,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff3A6431), width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff3A6431), width: 2.0),
              ),
              hintText: 'الاسم الاول',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: TextFormField(
            controller: controller.lastName,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff3A6431), width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff3A6431), width: 2.0),
              ),
              hintText: 'الاسم الاخير',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
