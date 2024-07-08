  
import 'package:aqua_grow/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLoader extends StatelessWidget {
  const AnimationLoader({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(animation,
              width: MediaQuery.sizeOf(context).width * 0.8),
          const SizedBox(height: 24),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          showAction
              ? SizedBox(
                  width: 200,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor),
                    child: Text(actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: Colors.white)),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
