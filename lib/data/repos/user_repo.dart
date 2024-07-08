 
import 'package:aqua_grow/data/repos/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/exceptions/firebase_exceptions.dart';
import '../../core/exceptions/platform_exceptions.dart';
import '../../features/presonal/model/user_model.dart';
 

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  // Database
  final _db = FirebaseFirestore.instance;

  // Function To Add User Data
  Future<void> saveUserData({required UserModel user}) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      throw TPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw "Something went wrong, please try again later";
    }
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentationSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .get();
      if (documentationSnapshot.exists) {
        return UserModel.fromSnapShot(documentationSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      throw TPlatformException(e.code).message;
    } catch (e) {
      
      
      debugPrint(e.toString());
      throw "Something went wrong, please try again later";
    }
  }

  Future<void> updateUserDetails({required UserModel updateUser}) async {
    try {
      await _db
          .collection("Users")
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      throw TPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw "Something went wrong, please try again later";
    }
  }

  Future<void> updateSingleField({required Map<String, dynamic> json}) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .update(json);
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      throw TPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw "Something went wrong, please try again later";
    }
  }

  Future<void> removeUserData({required String userID}) async {
    try {
      await _db.collection("Users").doc(userID).delete();
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      throw TPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw "Something went wrong, please try again later";
    }
  }
 
}
