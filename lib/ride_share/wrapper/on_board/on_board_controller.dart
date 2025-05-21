import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'dart:io' show Platform;

import 'package:ride_share/ride_share/auth/sign_up/sign_up_view.dart';
import 'package:ride_share/ride_share/auth/dev_sign_up/dev_sign_up_view.dart';
import 'package:ride_share/ride_share/wrapper/on_board/components/custom_dialog_card.dart';

class OnBoardController extends GetxController {


  var showDeveloperOptionCount = 0.obs;

  void manualDevTapHandle(BuildContext context) {
  showDeveloperOptionCount++;
  if (showDeveloperOptionCount > 5) {
    showDeveloperOptionCount.value = 0;
    Get.snackbar("I'm a developer...", "", snackPosition: SnackPosition.TOP);
    CustomDialogCard.show(context);
  }
}

  void kIsWebHandle(BuildContext context) {
    if (kIsWeb) {
      Get.snackbar("I'm a developer...", "", snackPosition: SnackPosition.TOP);
      CustomDialogCard.show(context);
    }
  }
}
