// ignore_for_file: file_names, unused_field, body_might_complete_normally_nullable, unused_local_variable

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';
import 'package:ride_share/ride_share/auth/sign_in/sign_in_view.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;
  set setIsLoading(bool value) => _isLoading.value = value;

  forgetPasswordMethod(
      String userEmail,
      ) async {
    try {
      setIsLoading = true;
      await firebaseAuth.sendPasswordResetEmail(email: userEmail).then((value){
        Get.snackbar(
          "Request Sent Sucessfully",
          "Password reesr link sent to $userEmail",
          snackPosition: SnackPosition.TOP,
          backgroundColor: RsColor.primaryThird,
          colorText: RsColor.white,
        );
        setIsLoading = false;
        Get.to(SignInView());
      }).onError((error, stackError){
        log("Error $error");
        Get.snackbar(
          "Error occur",
          "Error in password resent link sent to $userEmail",
          snackPosition: SnackPosition.TOP,
          backgroundColor: RsColor.primaryThird,
          colorText: RsColor.white,
        );
      });
      setIsLoading = false;
    } on FirebaseAuthException catch (e) {
      // Handle Firebase authentication-related errors
      setIsLoading = false;
      switch (e.code) {
        case 'email-already-in-use':
          'This email address is already in use. Please try logging in or use a different email.';
        case 'invalid-email':
          'The email address is invalid. Please check and enter a valid email.';
        case 'operation-not-allowed':
          'Email/password accounts are not enabled. Please contact support.';
        case 'weak-password':
          'The password provided is too weak. Please use a stronger password.';
        case 'too-many-requests':
          'Too many requests at the moment. Please try again later.';
        case 'user-token-expired':
          'Your session has expired. Please log in again.';
        case 'network-request-failed':
          'Network error occurred. Please check your internet connection.';
        case 'invalid-credential':
          'The supplied auth credential is incorrect, malformed or has expired.';
        default:
          'An unknown error occurred: ${e.message}';
      }
    } on FirebaseException catch(e){
      // Handle PlatformException
      setIsLoading = false;
      if (e.code == 'ERROR_INVALID_CREDENTIAL') {
        'The supplied auth credential is incorrect, malformed, or expired.';
      }
      if (e.code == 'invalid-credential') {
        'The supplied auth credential is incorrect, malformed, or expired.';
      }else {
        'An unknown error occurred: ${e.message}';
      }
    }catch (e) {
      // Catch any other types of exceptions and return a general error message
      setIsLoading = false;
      'An unknown error occurred: ${e.toString()}';
    }
  }
}
