import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_routing/app_route.dart';
import '../../../core/loaders/loaders.dart';
import '../../../core/loaders/popups.dart';
import '../../../data/repos/auth_repo.dart';
import '../../../data/repos/user_repo.dart';
import '../../presonal/model/user_model.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  //Implement registerController variables
  final hidePassword = true.obs;
   
  final email = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();

  Future<void> registerWithEmailAndPassword() async {
    // Start Loading
    try {
      FullscreenLoader.openLoadingDialog(
          "We are prossessing your request", "assets/loader-animation.json");
      // Check Internet Connection
 
      //Register User in the Firebase Authantication and Save user data
      final userCredential = await AuthenticationRepository.instance
          .registerUserWithEmailAndPassword(
        email: "alidiab8899@gmail.com",
        password: "Alidiab2003",
      );

      // Save Authanticated User data in the firestore
      final newUser = UserModel(
        email: 'alidiab8899@gmail.com',
        userName: "Mohamed",
        firstName: "Mohamed",
        lastName: 'Makeld',
        phoneNumber: '',
        profilePicture: "",
        id: userCredential.user!.uid,
      );

      // Add User to firestore
      final userRepo = Get.put(UserRepository());
      await userRepo.saveUserData(user: newUser);

      // Remove loader
      FullscreenLoader.stopLoading();
      Loaders.successSnackBar(title: "Success", message: "Account Created");

      // Navigate to verification Screen
      await Get.toNamed(AppRoute.verifyViewPath);
      debugPrint("User ID : ${userCredential.user!.uid}");
    } catch (e) {
      FullscreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
