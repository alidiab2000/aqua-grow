import 'package:aqua_grow/data/repos/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_routing/app_route.dart';
import '../../../core/loaders/loaders.dart';
import '../../../core/loaders/popups.dart';
import '../../../data/repos/auth_repo.dart';
import '../model/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final profileLoading = false.obs;
  final userRepository = Get.put(UserRepository());
  final imageUploading = false.obs;
  final user = UserModel.empty().obs;
  //Re auth vars
  final reAuthFormKey = GlobalKey<FormState>();
  final reAuthHidePassword = true.obs;
  final reAuthEmailController = TextEditingController();
  final reAuthPasswordController = TextEditingController();
  @override
  void onInit() async {
    super.onInit();
    await fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      profileLoading(true);
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading(false);
    }
  }

  Future<void> saveUserData(UserCredential? userCredential) async {
    try {
      //Refresh Data
      await fetchUserData();

      //If no record already exist
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          //Convert Name To first and Last Name
          final nameParts =
              UserModel.nameparts(userCredential.user!.displayName!);
          final userName =
              UserModel.generateUserName(userCredential.user!.displayName!);

          //Map Data
          final user = UserModel(
            id: userCredential.user!.uid,
            email: userCredential.user!.email ?? " ",
            userName: userName,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
            phoneNumber: userCredential.user!.phoneNumber ?? "",
            profilePicture: userCredential.user!.photoURL ?? "",
          );
          await userRepository.saveUserData(user: user);
        }
      }
    } catch (e) {
      Loaders.warningSnackBar(
          title: "Data Not Saved",
          message:
              "Something went wrong when saving Your information, You can re-save your data in your profile");
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      FullscreenLoader.openLoadingDialog(
          "We are prossessing your request", "assets/loader-animation.json");
      // Check Internet Connection

      if (!reAuthFormKey.currentState!.validate()) {
        FullscreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateEmailAndPasswordUser(
              email: reAuthEmailController.text.trim(),
              password: reAuthPasswordController.text.trim());
      await AuthenticationRepository.instance.deletAccount();
      FullscreenLoader.stopLoading();
      await Get.offAndToNamed(AppRoute.loginViewPath);
    } catch (e) {
      FullscreenLoader.stopLoading();
      Loaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
