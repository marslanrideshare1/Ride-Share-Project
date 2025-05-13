// ignore_for_file: file_names, unused_field, body_might_complete_normally_nullable, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../user/user_model.dart';

class SignUpController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;
  set setIsLoading(bool value) => _isLoading.value = value;

  final isPasswordVisibleForRegister = RxBool(true);

  Future<UserCredential?> signUpMethod(
    String userName,
    String userEmail,
    String userPassword,
    String userIdCardNo,
    String userPhone,
    UserRole userRole,
    String driverVehicleNo,
    String driverVehicleChassisNo,
    String userAddress,
    String userDeviceToken,
  ) async {
    try {
      setIsLoading = true;
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      // send email verification
      await userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
          uId: userCredential.user!.uid.toString(),
          username: userName.toString(),
          email: userEmail.toString(),
          idCardNo: userIdCardNo.toString(),
          phone: userPhone.toString(),
          vehicleNo: driverVehicleNo.toString(),
          vehicleChassisNo: driverVehicleChassisNo.toString(),
          userImg: "",
          userDeviceToken: "",
          country: "",
          city: "",
          userAddress: userAddress.toString(),
          street: "",
          role: userRole,
          requestStatus: UserRequest.Pending,
          isActive: true,
          createdAt: DateTime.now(),
      );
      print("user json "+userModel.toMap().toString());
      await firebaseFirestore
          .collection('user_register')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
      setIsLoading = false;
      return userCredential;
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
