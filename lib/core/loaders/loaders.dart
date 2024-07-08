import 'package:aqua_grow/core/loaders/animationLoaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullscreenLoader {
  static void openLoadingDialog(String? text, String? animation) {
    showDialog(
      barrierDismissible: false,
      context: Get.overlayContext!,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              AnimationLoader(
                text: text!,
                animation: animation!,
              )
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
