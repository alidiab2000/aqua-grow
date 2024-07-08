import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/loaders/popups.dart';
import '../../../data/repos/auth_repo.dart';

class VerifiyController extends GetxController {
  static VerifiyController get instance => Get.find();
  @override
  void onInit() {
    sendEmailVerificatiion();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send Email Verification link
  Future<void> sendEmailVerificatiion() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(title: "Email Sent", message: "Check your mail");
    } catch (e) {
      Loaders.errorSnackBar(title: "Oh snap", message: e.toString());
    }
  }

  //Timer to auto redirect on Email Verification
  Future<void> setTimerForAutoRedirect() async {
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) async {
        FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;

        if (user?.emailVerified ?? false) {
          timer.cancel();
        }
      },
    );
  }
}
