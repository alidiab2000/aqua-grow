import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../colors/app_colors.dart';

class Loaders {
  static successSnackBar({required String title, message = ""}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColor,
        isDismissible: true,
        shouldIconPulse: true,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: Colors.white));
  }

  static warningSnackBar({required String title, message = ""}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        isDismissible: true,
        shouldIconPulse: true,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: Colors.white));
  }

  static errorSnackBar({required String title, message = ""}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade600,
        isDismissible: true,
        shouldIconPulse: true,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: Colors.white));
  }
}
