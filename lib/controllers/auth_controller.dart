import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  Future<bool> signInwithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided.');
      }

      return false;
    }
  }

<<<<<<< HEAD
  // Future<void> registerwithEmailAndPassword(String email, String password) async {
  Future<bool> registerwithEmailAndPassword(
      String email, String password) async {
    try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
    );

    // Get.toNamed(RouteNames.homeScreen);
=======
  Future<bool> register(String email, String password, String phoneNumber,
      String fullName) async {
    try {
      var credentials =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      var user = credentials.user!;
      await user.updateDisplayName(fullName);
      await user.sendEmailVerification();
>>>>>>> cb8cf5e7f821d6d39842d15d62cfd6462efdbe56

    return true;
    } on FirebaseAuthException catch (e) {
<<<<<<< HEAD
    if (e.code == 'weak-password') {
    Get.snackbar('Error', 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
    Get.snackbar('Error', 'An account already exists for that email.');
    }

    return false;
    } catch (e) {
    print(e);
    Get.snackbar('Error', "Something went wrong");

    return false;
    }
=======
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'An account already exists for that email.');
      }

      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.snackbar('Error', "Something went wrong");

      return false;
>>>>>>> cb8cf5e7f821d6d39842d15d62cfd6462efdbe56
    }

  Future<bool> signInwithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      print(googleUser);

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication!;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);

      return true;

      // Get.toNamed(RouteNames.homeScreen);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return false;
    }
  }

  Future<bool> signout() async {
    try {
      await FirebaseAuth.instance.signOut();

      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return false;
    }
  }

  Future<bool> forgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return false;
    }
  }
}