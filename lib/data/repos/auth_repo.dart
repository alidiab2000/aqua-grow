import 'package:aqua_grow/data/repos/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/app_routing/app_route.dart';
import '../../core/exceptions/firebase_auth_exceptions.dart';
import '../../core/exceptions/firebase_exceptions.dart';
import '../../core/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Remove GetStorage and add SharedPreferences
  late SharedPreferences prefs;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;
  final authUser = FirebaseAuth.instance.currentUser;

  @override
  void onReady() async {
    super.onReady();
    prefs = await SharedPreferences.getInstance();
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function To show Relevant Screen
  screenRedirect() async {
    final User? user = _auth.currentUser;

    if (user != null) {
      debugPrint("===================User Logged In=================");
      if (user.emailVerified) {
        await Get.offAllNamed(AppRoute.navigationMenuPath);
      } else {
        await Get.offAllNamed(AppRoute.verifyViewPath,
            arguments: _auth.currentUser!.email);
      }
    } else {
      debugPrint("=================== User Not Logged In=================");

      var isFirstTime = "isFirstTime";
      if (!prefs.containsKey(isFirstTime)) {
        await prefs.setBool(isFirstTime, true);
      }

      prefs.getBool(isFirstTime) != true
          ? Get.offAllNamed(AppRoute.loginViewPath)
          : Get.offAndToNamed(AppRoute.onBoarding);
    }
  }

  Future<UserCredential> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseAuthException(e.code).message;
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

  Future<UserCredential> registerUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseAuthException(e.code).message;
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

  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseAuthException(e.code).message;
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

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseAuthException(e.code).message;
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

  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseAuthException(e.code).message;
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

  Future<void> deletAccount() async {
    try {
      await UserRepository.instance
          .removeUserData(userID: _auth.currentUser!.uid);
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseAuthException(e.code).message;
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

  Future<void> reAuthenticateEmailAndPasswordUser(
      {required String email, required String password}) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseAuthException(e.code).message;
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

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      Get.offAndToNamed(AppRoute.loginViewPath);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw TFirebaseAuthException(e.code).message;
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
