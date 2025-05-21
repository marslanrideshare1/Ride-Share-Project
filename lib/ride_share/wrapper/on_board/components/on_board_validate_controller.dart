// lib/ride_share/wrapper/on_board/components/on_board_validate_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardValidateController extends GetxController {
  final TextEditingController devController = TextEditingController();
  final RxString idCardNo = '3550106361973'.obs;

  final RxString idCardNoValidate = ''.obs;

  void clearAllError() {
    idCardNoValidate.value = '';
  }

  String? setValidateCNIC(String value) {
    if (value.isEmpty) {
      idCardNoValidate.value = 'Please enter CNIC number';
    } else if (value.contains('-')) {
      idCardNoValidate.value = 'CNIC number should not contain dashes';
    } else if (value.length != 13) {
      idCardNoValidate.value = 'CNIC number must be 13 digits';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      idCardNoValidate.value = 'CNIC number can only contain digits';
    } else {
      idCardNoValidate.value = '';
    }
    return idCardNoValidate.value.isEmpty ? null : idCardNoValidate.value;
  }

  void clearError(String fieldName) {
    if (fieldName == 'idCardNoValidate') {
      idCardNoValidate.value = '';
    }
  }

  @override
  void onClose() {
    devController.dispose();
    super.onClose();
  }
}
