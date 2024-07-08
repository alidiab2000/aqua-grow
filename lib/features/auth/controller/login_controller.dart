import 'package:aqua_grow/features/presonal/contollers/navigation_menu_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/loaders/loaders.dart';
import '../../../core/loaders/popups.dart';
import '../../../data/repos/auth_repo.dart';
import '../../presonal/contollers/user_controller.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  late SharedPreferences prefs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final navigationMenuController = Get.put(NavigationMenuController());
  static LoginController get instance => Get.find();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("REMEMBER_ME_EMAIL")) {
      emailController.text = prefs.getString("REMEMBER_ME_EMAIL") ?? '';
      passwordController.text = prefs.getString("REMEMBER_ME_PASSWORD") ?? '';
    }
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      FullscreenLoader.openLoadingDialog(
          "We are processing your request", "assets/loader-animation.json");
      // Check Internet Connection

      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        FullscreenLoader.stopLoading();
        return;
      }

      // Remember Me save email and password
      if (rememberMe.value) {
        prefs.setString(
          "REMEMBER_ME_EMAIL",
          emailController.text.trim(),
        );
        prefs.setString(
          "REMEMBER_ME_PASSWORD",
          passwordController.text.trim(),
        );
      }
      // ignore: unused_local_variable
      final userCredential =
          await AuthenticationRepository.instance.loginUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Stop Loading
      FullscreenLoader.stopLoading();

      // Show Success SnackBar
      Loaders.successSnackBar(title: "Login Successful", message: "Welcome");

      navigationMenuController.selectedIndex.value = 0;

      // Go to Home Screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullscreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  
}
