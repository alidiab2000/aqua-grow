import 'package:flutter/material.dart';

class CustomElvatedButton extends StatelessWidget {
  const CustomElvatedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
  });
  final String text;
  final void Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(color),
        elevation: WidgetStateProperty.all(0),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
