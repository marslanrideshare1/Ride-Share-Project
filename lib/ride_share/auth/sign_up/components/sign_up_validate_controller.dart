import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpValidateController extends GetxController{

  // Declare all validations as non-nullable RxStrings with empty initial values
  final userNameValidate = RxString('');
  final emailValidate = RxString('');
  final passwordValidate = RxString('');
  final idCardNoValidate = RxString('');
  final phoneNoValidate = RxString('');
  final addressValidate = RxString('');
  final panelValidate = RxString('');
  final vehicleNoValidate = RxString('');
  final vehicleChassisNoValidate = RxString('');

  void clearAllError() {
    userNameValidate.value = '';
    emailValidate.value = '';
    passwordValidate.value = '';
    idCardNoValidate.value = '';
    phoneNoValidate.value = '';
    addressValidate.value = '';
    panelValidate.value = '';
    vehicleNoValidate.value = '';
    vehicleChassisNoValidate.value = '';
  }
  String? setValidateUserName(String value) {
    if (value.isEmpty) {
      userNameValidate.value = 'Please enter a username';
    } else if (value.length < 3) {
      userNameValidate.value = 'Username must be at least 3 characters long';
    } else if (value.length > 30) {
      userNameValidate.value = 'Username cannot exceed 30 characters';
    } else if (!RegExp(r'^[a-zA-Z0-9_ ]+$').hasMatch(value)) {  // Added space in regex
      userNameValidate.value = 'Username can only contain letters, numbers, underscores, and spaces';
    } else {
      userNameValidate.value = "";
    }
    return userNameValidate.value.isEmpty ? null : userNameValidate.value;
  }

  String? setValidateEmail(String value) {
    if (value.isEmpty) {
      emailValidate.value = 'Please enter an email address';
    }else if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      caseSensitive: false,
    ).hasMatch(value)) {
      emailValidate.value = 'Please enter a valid email (e.g. example@gmail.com)';
    }else if (value.length > 100) {
      emailValidate.value ='Email address too long';
    }else{
      emailValidate.value = "";
    }
    return emailValidate.value.isEmpty ? null : emailValidate.value ;
  }

  String? setValidatePassword(String value) {
    if (value.isEmpty) {
      passwordValidate.value =  'Please enter a password';
    }else if (value.length < 8) {
      passwordValidate.value =  'Password must be at least 8 characters';
    }else if (value.length > 20) {
      passwordValidate.value =  'Password cannot exceed 64 characters';
    }else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      passwordValidate.value = 'Password should contain at least one uppercase letter';
    }else if (!RegExp(r'[a-z]').hasMatch(value)) {
      passwordValidate.value =  'Password should contain at least one lowercase letter';
    }else if (!RegExp(r'[0-9]').hasMatch(value)) {
      passwordValidate.value = 'Password should contain at least one number';
    }else{
      passwordValidate.value = "";
    }
    return passwordValidate.value.isEmpty ?  null : passwordValidate.value;
  }

  String? setValidateCNIC(String value) {
    if (value.isEmpty) {
      idCardNoValidate.value =  'Please enter CNIC number';
    }else if (value.contains('-')) {
      idCardNoValidate.value =  'CNIC number should not contain dashes';
    }else if (value.length != 13) {
      idCardNoValidate.value = 'CNIC number must be 13 digits';
    }else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      idCardNoValidate.value =  'CNIC number can only contain digits';
    }else{
      idCardNoValidate.value = "";
    }
    return idCardNoValidate.value.isEmpty ? null : idCardNoValidate.value;
  }

  String? setValidatePhoneNumber(String value) {
    if (value.isEmpty) {
      phoneNoValidate.value = 'Please enter phone number';
    } else if (!value.startsWith('+92')) {
      phoneNoValidate.value = 'Phone number must start with +92';
    } else if (value.length != 13) {  // +92 (3) + 10 digits = 13 characters
      phoneNoValidate.value = 'Phone number must be 13 characters (e.g. +923001234567)';
    } else if (!RegExp(r'^\+92[0-9]{10}$').hasMatch(value)) {
      phoneNoValidate.value = 'Please enter a valid phone number (e.g. +923001234567)';
    } else {
      phoneNoValidate.value = "";
    }
    return phoneNoValidate.value.isEmpty ? null : phoneNoValidate.value;
  }

  String? setValidateAddress(String value) {
    if (value.isEmpty) {
      addressValidate.value = 'Please enter address';
    }else if (value.length < 10) {
      addressValidate.value ='Address too short';
    }else if (value.length > 200) {
      addressValidate.value = 'Address cannot exceed 200 characters';
    }else{
      addressValidate.value = "";
    }
    return addressValidate.value.isEmpty ? null : addressValidate.value;
  }

  String? setValidateUserStatus(String value) {
    if (value.isEmpty) {
      panelValidate.value = 'Please select user status';
    }else{
      panelValidate.value = "";
    }
    return  panelValidate.value.isEmpty ?  null :  panelValidate.value;
  }

  String? setValidateVehicleNumber(String value) {
    if (value.isEmpty) {
      vehicleNoValidate.value = 'Please enter vehicle number';
    } else if (!RegExp(
      r'^[A-Z]{2,3}[-\s]?[0-9]{1,4}([-\s]?[0-9]{1,4})?$',
      caseSensitive: true,
    ).hasMatch(value)) {
      vehicleNoValidate.value = 'Enter valid vehicle number (e.g. ALQ-7608, ALQ 7608, LEA-12-1234)';
    } else if (value.length < 6 || value.length > 12) {
      vehicleNoValidate.value = 'Vehicle number must be between 6-12 characters';
    } else {
      vehicleNoValidate.value = "";
    }
    return vehicleNoValidate.value.isEmpty ? null : vehicleNoValidate.value;
  }

  String? setValidateChassisNumber(String value) {
    if (value.isEmpty) {
      vehicleChassisNoValidate.value = 'Please enter chassis number';
    }else
    // Chassis numbers typically contain letters and numbers
    if (!RegExp(r'^[A-Za-z0-9]{6,30}$').hasMatch(value)) {
      vehicleChassisNoValidate.value = 'Chassis number must be 6-30 alphanumeric characters';
    }else  if (value.length < 6 || value.length > 30){
      vehicleChassisNoValidate.value = "Vehicle chassis number must be between 6-30 characters";
    } else{
      vehicleChassisNoValidate.value = "";
    }
    return vehicleChassisNoValidate.value.isEmpty ? null : vehicleChassisNoValidate.value;
  }
  // Clear specific error message when user moves to the next field
   clearError(String fieldName) {
    switch (fieldName) {
      case 'userNameValidate':
        userNameValidate.value = "";
        break;
        case 'emailValidate':
        emailValidate.value = "";
        break;
       case 'passwordValidate':
        passwordValidate.value = "";
        break;
        case 'idCardNoValidate':
          idCardNoValidate.value = "";
        break;
        case 'phoneNoValidate':
          phoneNoValidate.value = "";
        break;
        case 'addressValidate':
          addressValidate.value = "";
        break;
        case 'panelValidate':
          panelValidate.value = "";
        break;
        case 'vehicleNoValidate':
          vehicleNoValidate.value = "";
        break;
        case 'vehicleChassisNoValidate':
          vehicleChassisNoValidate.value = "";
        break;
    }
  }

}