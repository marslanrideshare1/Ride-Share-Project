// lib/ride_share/wrapper/on_board/components/custom_dialog_card.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/dashboard/rs_responsive.dart';
import 'package:ride_share/ride_share/auth/dev_sign_up/dev_sign_up_view.dart';
import 'package:ride_share/ride_share/wrapper/on_board/components/on_board_validate_controller.dart';
import 'package:ride_share/widgets/custom_text_form_field.dart';
import '../../../../core/helper/common.dart';
import '../../../../core/theme/components/rs_color.dart';
import '../../../../widgets/custom_button.dart';

class CustomDialogCard extends StatefulWidget {
  const CustomDialogCard({super.key});

  static Future<void> show(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) => const CustomDialogCard(),
    );
  }

  @override
  State<CustomDialogCard> createState() => _CustomDialogCardState();
}

class _CustomDialogCardState extends State<CustomDialogCard> {
  final FocusNode devFocusNode = FocusNode();
  final OnBoardValidateController onBoardValidateController =
  Get.put(OnBoardValidateController());

  @override
  void dispose() {
    devFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: WillPopScope(
          onWillPop: () async => false,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            child: Container(
              width:RsResponsive.isDesktop(context) || RsResponsive.isTablet(context) ? MediaQuery.of(context).size.width * 0.25 : MediaQuery.of(context).size.width,
              padding: EdgeInsets.zero,
              color: RsColor.primaryFirst,
              child: Container(
                decoration: BoxDecoration(
                  color: RsColor.primaryFirst,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 10),
                      child: Text(
                        "Dev Ride Share Status?",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                            () => CustomTextFormField(
                          controller: onBoardValidateController.devController,
                          focusNode: devFocusNode,
                          keyboardType: TextInputType.number,
                          hintText: "I'm a developer...",
                          hintFadeDuration: const Duration(seconds: 2),
                          fillColor: Colors.grey.withOpacity(0.5),
                          mouseCursor: SystemMouseCursors.zoomOut,
                          suffix: SizedBox(),
                          onFieldSubmitted: (value) {
                            Common.changeFocusOfField(
                                context, devFocusNode, null);
                          },
                          onChanged: (value) {
                            onBoardValidateController.setValidateCNIC(value);
                          },
                          onEditingComplete: () =>
                              onBoardValidateController.clearError("idCardNoValidate"),
                          errorText: onBoardValidateController.idCardNoValidate.value.isEmpty
                              ? null
                              : onBoardValidateController.idCardNoValidate.value,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10, top: 5),
                      child: Obx(
                            () => CustomButton(
                          text: "OKK",
                          textStyle:
                          Theme.of(context).textTheme.headlineSmall,
                          onPressed: onBoardValidateController.idCardNoValidate.value.isEmpty && onBoardValidateController.devController.text == onBoardValidateController.idCardNo.value
                              ? () {
                            final idCard = onBoardValidateController
                                .devController.text
                                .trim();
                            final validMessage = onBoardValidateController
                                .setValidateCNIC(idCard);

                            if (validMessage == null && idCard == onBoardValidateController.idCardNo.value) {
                              onBoardValidateController.devController.clear();
                              onBoardValidateController.clearAllError();
                              Get.to(() => const DevSignUpView());
                              log("Successfully validated");
                            } else {
                              log("Validation failed");
                            }
                          } : null,
                          fullWidth: true,
                          borderRadius: 10,
                          backgroundColor: onBoardValidateController
                              .devController.text ==
                              onBoardValidateController.idCardNo.value
                              ? RsColor.primarySecond.withOpacity(0.6)
                              : Colors.grey.withOpacity(0.5),
                          elevation: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
