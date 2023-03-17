import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:timely/controllers/base_controller.dart';
import 'package:timely/utilities/show_error_snackbar.dart';

class AuthController extends BaseController {
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
        debugPrint(e.toString());
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
        debugPrint(googleUser.toString());
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      return true;

      // Get.toNamed(RouteNames.homeScreen);
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }

      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      return true;
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Logout failed');
        debugPrint(e.toString());
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
        debugPrint(e.toString());
      }

      return false;
    }
  }

  User? get currentUser {
    return FirebaseAuth.instance.currentUser;
  }
}
