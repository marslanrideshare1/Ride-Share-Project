import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';
import 'package:get/get.dart';
import 'package:ride_share/ride_share/auth/sign_in/sign_in_view.dart';
import 'package:ride_share/ride_share/auth/sign_up/components/custom_dialog_panel.dart';
import 'package:ride_share/ride_share/auth/sign_up/components/sign_up_validate_controller.dart';
import 'package:ride_share/ride_share/auth/sign_up/sign_up_controller.dart';
import 'package:ride_share/ride_share/auth/user/user_model.dart';
import 'package:ride_share/widgets/custom_button.dart';
import 'package:ride_share/widgets/custom_square_button.dart';
import 'package:ride_share/widgets/custom_text_form_field.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../core/helper/common.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController idCardNoController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController panelController = TextEditingController();
  final TextEditingController vehicleNoController = TextEditingController();
  final TextEditingController vehicleChassisNoController =
      TextEditingController();

  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode idCardNoFocusNode = FocusNode();
  final FocusNode phoneNoFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  final FocusNode panelFocusNode = FocusNode();
  final FocusNode vehicleNoFocusNode = FocusNode();
  final FocusNode vehicleChassisNoFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();
  final SignUpValidateController validateController =
      Get.put(SignUpValidateController());
  final SignUpController signUpController = Get.put(SignUpController());

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.purple[100],
              child: Text(item.length.toString()),
            ),
            Text(
              item,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      );
  @override
  void initState() {
    super.initState();
    validateController.clearAllError();
  }

  @override
  void dispose() {
    validateController.clearAllError();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    idCardNoController.dispose();
    phoneNoController.dispose();
    addressController.dispose();
    panelController.dispose();
    vehicleNoController.dispose();
    vehicleChassisNoController.dispose();

    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    idCardNoFocusNode.dispose();
    phoneNoFocusNode.dispose();
    addressFocusNode.dispose();
    panelFocusNode.dispose();
    vehicleNoFocusNode.dispose();
    vehicleChassisNoFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              "Register",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            centerTitle: true,
            pinned: true,
            leading: CustomSquareButton.squareButton(
              onTap: () {
                Get.to(SignInView());
              },
              border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimary, width: 1.5),
              child: SvgPicture.asset(
                "assets/images/back.svg",
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            expandedHeight: 200,
            backgroundColor: Theme.of(context).colorScheme.primary,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.asset(
                    "assets/images/register_bg.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          const Color(0xff1EFBFA).withOpacity(0.6),
                          const Color(0xff16978A).withOpacity(0.3),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    GradientText(
                      'Welcome to Ride Share Register.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                      gradientType: GradientType.linear,
                      colors: [RsColor.primaryFirst, RsColor.primarySecond],
                    ),
                    Obx(
                      () => CustomTextFormField(
                        controller: fullNameController,
                        focusNode: fullNameFocusNode,
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        hintText: "Please! enter full name...",
                        hintFadeDuration: Duration(seconds: 2),
                        mouseCursor: SystemMouseCursors.zoomOut,
                        suffixIcon: Icons.person,
                        onFieldSubmitted: (value) {
                          Common.changeFocusOfField(
                              context, fullNameFocusNode, emailFocusNode);
                        },
                        onChanged: (value) =>
                            validateController.setValidateUserName(value),
                        onEditingComplete: () =>
                            validateController.clearError("userNameValidate"),
                        // validator: (value) => validateController.setValidateUserName(value.toString()),
                        errorText:
                            validateController.userNameValidate.value.isEmpty
                                ? null
                                : validateController.userNameValidate.value
                                    .toString(),
                      ),
                    ),
                    Obx(
                      () => CustomTextFormField(
                          controller: emailController,
                          focusNode: emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          hintText: "Please! enter email...",
                          hintFadeDuration: Duration(seconds: 2),
                          mouseCursor: SystemMouseCursors.zoomOut,
                          onFieldSubmitted: (value) {
                            Common.changeFocusOfField(
                                context, emailFocusNode, passwordFocusNode);
                          },
                          onChanged: (value) =>
                              validateController.setValidateEmail(value),
                          onEditingComplete: () =>
                              validateController.clearError("emailValidate"),
                          // validator: (value) => validateController.setValidateEmail(value.toString()),
                          errorText:
                              validateController.emailValidate.value.isEmpty
                                  ? null
                                  : validateController.emailValidate.value
                                      .toString()),
                    ),
                    Obx(
                      () => CustomTextFormField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          keyboardType: TextInputType.text,
                          hintText: "Please! enter password...",
                          hintFadeDuration: Duration(seconds: 2),
                          mouseCursor: SystemMouseCursors.zoomOut,
                          obscureText: signUpController.isPasswordVisibleForRegister.value,
                          suffix: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [
                                    RsColor.primarySecond,
                                    RsColor.primarySecond
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ).createShader(bounds);
                              },
                              child: GestureDetector(
                                onTap: (){
                                  signUpController.isPasswordVisibleForRegister.toggle();
                                },
                                child: Icon(signUpController.isPasswordVisibleForRegister.value ? Icons.visibility_off : Icons.visibility, color: Colors.white,size: 24,),
                              ),
                          ),
                          onFieldSubmitted: (value) {
                            Common.changeFocusOfField(
                                context, passwordFocusNode, idCardNoFocusNode);
                          },
                          onChanged: (value) =>
                              validateController.setValidatePassword(value),
                          onEditingComplete: () =>
                              validateController.clearError("passwordValidate"),
                          // validator: (value) => validateController.setValidatePassword(value.toString()),
                          errorText: validateController
                                  .passwordValidate.value.isEmpty
                              ? null
                              : validateController.passwordValidate.toString()),
                    ),
                    Obx(
                      () => CustomTextFormField(
                        controller: idCardNoController,
                        focusNode: idCardNoFocusNode,
                        keyboardType: TextInputType.text,
                        hintText: "Please! enter CNIC...",
                        hintFadeDuration: Duration(seconds: 2),
                        mouseCursor: SystemMouseCursors.zoomOut,
                        suffixIcon: Icons.credit_card,
                        onFieldSubmitted: (value) {
                          Common.changeFocusOfField(
                              context, idCardNoFocusNode, phoneNoFocusNode);
                        },
                        onChanged: (value) =>
                            validateController.setValidateCNIC(value),
                        onEditingComplete: () =>
                            validateController.clearError("idCardNoValidate"),
                        // validator: (value) => validateController.setValidateCNIC(value.toString()),
                        errorText:
                            validateController.idCardNoValidate.value.isEmpty
                                ? null
                                : validateController.idCardNoValidate.value
                                    .toString(),
                      ),
                    ),
                    Obx(
                      () => CustomTextFormField(
                        controller: phoneNoController,
                        focusNode: phoneNoFocusNode,
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        hintText: "Please! enter phone...",
                        hintFadeDuration: Duration(seconds: 2),
                        mouseCursor: SystemMouseCursors.zoomOut,
                        suffixIcon: Icons.phone,
                        onFieldSubmitted: (value) {
                          Common.changeFocusOfField(
                              context, phoneNoFocusNode, null);
                        },
                        onChanged: (value) {
                          validateController.setValidatePhoneNumber(value);
                        },
                        onEditingComplete: () =>
                            validateController.clearError("phoneNoValidate"),
                        // validator: (value) {
                        //  validateController.setValidatePhoneNumber(value.toString());
                        // },
                        errorText:
                            validateController.phoneNoValidate.value.isEmpty
                                ? null
                                : validateController.phoneNoValidate.value
                                    .toString(),
                      ),
                    ),
                    Obx(
                      () => CustomTextFormField(
                          controller: addressController,
                          focusNode: addressFocusNode,
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (value) {
                            Common.changeFocusOfField(
                                context, addressFocusNode, panelFocusNode);
                            customDialogPanel(context, panelController, () {
                              Common.changeFocusOfField(
                                  context, panelFocusNode, vehicleNoFocusNode);
                            });
                          },
                          hintText: "Please! enter address...",
                          hintFadeDuration: Duration(seconds: 2),
                          mouseCursor: SystemMouseCursors.zoomOut,
                          suffix: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [
                                    RsColor.primarySecond,
                                    RsColor.primarySecond
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ).createShader(bounds);
                              },
                              child: Lottie.asset(
                                "assets/LocationIcon-Animation.json",
                                width: 24.0,
                                height: 24.0,
                              )),
                          onChanged: (value) =>
                              validateController.setValidateAddress(value),
                          onEditingComplete: () =>
                              validateController.clearError("addressValidate"),
                          // validator: (value) => validateController.setValidateAddress(value.toString()),
                          errorText:
                              validateController.addressValidate.value.isEmpty
                                  ? null
                                  : validateController.addressValidate.value
                                      .toString()),
                    ),
                    Obx(() => CustomTextFormField(
                        controller: panelController,
                        focusNode: panelFocusNode,
                        // keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {
                          Common.changeFocusOfField(
                              context, panelFocusNode, vehicleNoFocusNode);
                        },
                        hintText: "Choose ride share status...",
                        hintFadeDuration: Duration(seconds: 2),
                        mouseCursor: SystemMouseCursors.zoomOut,
                        readOnly: true,
                        suffix: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [
                                RsColor.primaryFirst.withOpacity(0.8),
                                RsColor.primarySecond.withOpacity(0.6)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(bounds);
                          },
                          child: Icon(Icons.keyboard_arrow_down,
                              color: Colors.white, size: 24),
                        ),
                        onTap: () {
                          log("Dev ${panelController.text}");
                          log("tap");
                          customDialogPanel(context, panelController, () {
                            Common.changeFocusOfField(
                                context, panelFocusNode, vehicleNoFocusNode);
                          });
                        },
                        onChanged: (value) =>
                            validateController.setValidateUserStatus(value),
                        onEditingComplete: () =>
                            validateController.clearError("panelValidate"),
                        // validator: (value) => validateController.setValidateUserStatus(value.toString()),
                        errorText:
                            validateController.panelValidate.value.isEmpty
                                ? null
                                : validateController.panelValidate.value
                                    .toString())),
                    Obx(
                      () => Visibility(
                        visible: panelController.text == "Driver",
                        child: CustomTextFormField(
                          controller: vehicleNoController,
                          focusNode: vehicleNoFocusNode,
                          keyboardType: TextInputType.text,
                          hintText: "Please! enter vehicle number...",
                          hintFadeDuration: Duration(seconds: 2),
                          mouseCursor: SystemMouseCursors.zoomOut,
                          suffix: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [
                                    RsColor.primaryFirst,
                                    RsColor.primarySecond.withOpacity(0.6)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ).createShader(bounds);
                              },
                              child: Image.asset(
                                "assets/images/vehicle.png",
                                width: 24.0,
                                height: 24.0,
                                color: Colors.white,
                              )),
                          onFieldSubmitted: (value) {
                            Common.changeFocusOfField(context,
                                vehicleNoFocusNode, vehicleChassisNoFocusNode);
                          },
                          onChanged: (value) => validateController
                              .setValidateVehicleNumber(value),
                          onEditingComplete: () => validateController
                              .clearError("vehicleNoValidate"),
                          // validator: (value) => validateController.setValidateVehicleNumber(value.toString()),
                          errorText:
                              validateController.vehicleNoValidate.value.isEmpty
                                  ? null
                                  : validateController.vehicleNoValidate.value
                                      .toString(),
                        ),
                      ),
                    ),
                    Obx(() => Visibility(
                          visible: panelController.text == "Driver",
                          child: CustomTextFormField(
                            controller: vehicleChassisNoController,
                            focusNode: vehicleChassisNoFocusNode,
                            keyboardType: TextInputType.text,
                            hintText: "Please! enter vehicle chassis number...",
                            hintFadeDuration: Duration(seconds: 2),
                            mouseCursor: SystemMouseCursors.zoomOut,
                            suffix: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                    colors: [
                                      RsColor.primaryFirst,
                                      RsColor.primarySecond.withOpacity(0.6)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ).createShader(bounds);
                                },
                                child: Image.asset(
                                  "assets/images/vehicle.png",
                                  width: 24.0,
                                  height: 24.0,
                                  color: Colors.white,
                                )),
                            onFieldSubmitted: (value) {
                              Common.changeFocusOfField(
                                  context, vehicleChassisNoFocusNode, null);
                            },
                            onChanged: (value) => validateController
                                .setValidateChassisNumber(value),
                            onEditingComplete: () => validateController
                                .clearError("vehicleChassisNoValidate"),
                            validator: (value) => validateController
                                .setValidateChassisNumber(value.toString()),
                            errorText: validateController
                                    .vehicleChassisNoValidate.value.isEmpty
                                ? null
                                : validateController
                                    .vehicleChassisNoValidate.value
                                    .toString(),
                          ),
                        )),
                    Obx(
                      () => CustomButton(
                        fullWidth: true,
                        text: "Register",
                        isLoading: signUpController.isLoading,
                        onPressed: () async {
                          log("running");
                          final userName = fullNameController.text.toString();
                          final userEmail = emailController.text.toString();
                          final userPassword =
                              passwordController.text.toString();
                          final userIdCardNo =
                              idCardNoController.text.toString();
                          final userPhone = phoneNoController.text.toString();
                          final userRole = panelController.text.toString();
                          final driverVehicleNo =
                              vehicleNoController.text.toString();
                          final driverVehicleChassisNo =
                              vehicleChassisNoController.text.toString();
                          final userAddress = addressController.text.toString();
                          try {
                            log("try");
                            if (validateController
                                        .setValidateUserName(userName) ==
                                    null &&
                                validateController
                                        .setValidateEmail(userEmail) ==
                                    null &&
                                validateController
                                        .setValidatePassword(userPassword) ==
                                    null &&
                                validateController
                                        .setValidateCNIC(userIdCardNo) ==
                                    null &&
                                validateController
                                        .setValidatePhoneNumber(userPhone) ==
                                    null &&
                                validateController
                                        .setValidateAddress(userAddress) ==
                                    null) {
                              if (panelController.text == "Driver") {
                                if (validateController.setValidateVehicleNumber(
                                            driverVehicleNo) !=
                                        null ||
                                    validateController.setValidateChassisNumber(
                                            driverVehicleChassisNo) !=
                                        null) {
                                  return;
                                }
                              }
                              log("method");
                              UserRole roleName= userRoleFromString(userRole);
                              print('Selected role is '+roleName.name.toString());
                              signUpController
                                  .signUpMethod(
                                userName,
                                userEmail,
                                userPassword,
                                userIdCardNo,
                                userPhone,
                                userRoleFromString(userRole),
                                driverVehicleNo,
                                driverVehicleChassisNo,
                                userAddress,
                                "",
                              )
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Verification your email"), // Required
                                    duration: Duration(
                                        seconds: 5), // Optional duration
                                  ),
                                );
                                // FirebaseAuth.instance.signOut();
                                Get.to(SignInView());
                                log("Data ${value?.user!.uid}");
                                log("Success");
                              }).onError((e, s) {
                                log("Error $e");
                                log("Error Stack $s");
                              });
                            }
                          } catch (e) {
                            log("Error $e");
                          }
                        },
                        height: 50,
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        gradientColors: [
                          RsColor.primaryFirst.withOpacity(0.9),
                          RsColor.primarySecond.withOpacity(0.8)
                        ],
                        borderRadius: 10,
                      ),
                    ),
                    Common.customRichText(context,
                        title: "Already have an account? ",
                        subTitle: "Sign in", onTap: () {
                      log("Sign up");
                      Get.to(SignInView());
                    }),
                    SizedBox(height: 200)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
