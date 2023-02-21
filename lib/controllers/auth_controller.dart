import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  Future<bool> signInwithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Get.toNamed(RouteNames.homeScreen);

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

  // Future<void> registerwithEmailAndPassword(String email, String password) async {
  Future<bool> registerwithEmailAndPassword(
      String email, String password) async {
    try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
    );

    // Get.toNamed(RouteNames.homeScreen);

    return true;
    } on FirebaseAuthException catch (e) {
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
    }

  Future<bool> signInwithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

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
      print(e);

      return false;
    }
  }

  Future<bool> signout() async {
    try {
      await FirebaseAuth.instance.signOut();

      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }

  Future<bool> forgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }
}
