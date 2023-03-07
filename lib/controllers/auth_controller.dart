import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:timely/utilities/show_error_snackbar.dart';

class AuthController extends GetxController {
  Future<bool> signInwithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showErrorSnackbar('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showErrorSnackbar('Wrong password provided.');
      }

      return false;
    }
  }

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

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showErrorSnackbar('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showErrorSnackbar('An account already exists for that email.');
      }

      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      showErrorSnackbar("Something went wrong");

      return false;
    }
  }

  Future<bool> signInwithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(clientId: "").signIn();

      if (kDebugMode) {
        print(googleUser);
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

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
        print('Logout failed');
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
