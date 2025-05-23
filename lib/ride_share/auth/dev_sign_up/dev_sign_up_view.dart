import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';
import 'package:get/get.dart';
import 'package:ride_share/local/local_storage.dart';
import 'package:ride_share/ride_share/auth/sign_in/components/forget_password_view.dart';
import 'package:ride_share/ride_share/auth/sign_in/sign_in_controller.dart';
import 'package:ride_share/ride_share/auth/sign_up/components/sign_up_validate_controller.dart';
import 'package:ride_share/ride_share/auth/sign_up/sign_up_view.dart';
import 'package:ride_share/ride_share/auth/user/user_model.dart';
import 'package:ride_share/ride_share/developer/developer_panel.dart';
import 'package:ride_share/ride_share/driver/driver_panel.dart';
import 'package:ride_share/ride_share/passenger/passenger_panel.dart';
import 'package:ride_share/ride_share/wrapper/on_board/on_board_view.dart';
import 'package:ride_share/widgets/custom_button.dart';
import 'package:ride_share/widgets/custom_divider_row.dart';
import 'package:ride_share/widgets/custom_social_button.dart';
import 'package:ride_share/widgets/custom_square_button.dart';
import 'package:ride_share/widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../core/helper/common.dart';
import '../../../dashboard/screens/main/main_screen.dart';
import '../../wrapper/splash/splash_controller.dart';
import '../sign_in/sign_in_view.dart';

class DevSignUpView extends StatefulWidget {
  const DevSignUpView({super.key});

  @override
  State<DevSignUpView> createState() => _DevSignUpViewState();
}

class _DevSignUpViewState extends State<DevSignUpView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  final SignInController signInController = Get.put(SignInController());
  final SplashController splashController = Get.put(SplashController());

  final SignUpValidateController validateController =
  Get.put(SignUpValidateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              "Sign Up",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            centerTitle: true,
            pinned: true,
            leading: CustomSquareButton.squareButton(
              onTap: () {
                Get.to(SignUpView());
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
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        controller: emailController,
                        focusNode: emailFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        hintText: "Please! enter email...",
                        hintFadeDuration: Duration(seconds: 4),
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
                  Obx(() => CustomTextFormField(
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      hintText: "Please! enter password...",
                      hintFadeDuration: Duration(seconds: 4),
                      mouseCursor: SystemMouseCursors.zoomOut,
                      obscureText:
                      signInController.isPasswordVisibleForLogin.value,
                      // suffixIcon: Icons.visibility_off,
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
                          onTap: () {
                            signInController.isPasswordVisibleForLogin.toggle();
                          },
                          child: Icon(
                            signInController.isPasswordVisibleForLogin.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        Common.changeFocusOfField(
                            context, passwordFocusNode, null);
                      },
                      onChanged: (value) =>
                          validateController.setValidatePassword(value),
                      onEditingComplete: () =>
                          validateController.clearError("passwordValidate"),
                      // validator: (value) => validateController.setValidatePassword(value.toString()),
                      errorText: validateController
                          .passwordValidate.value.isEmpty
                          ? null
                          : validateController.passwordValidate.toString())),
                  SizedBox(height: 10),
                  Obx(
                        () => CustomButton(
                      fullWidth: true,
                      text: "Sign Up",
                      isLoading: signInController.isLoading,
                      onPressed: () async {
                        final userEmail =
                        emailController.value.text.trim().toString();
                        final userPassword =
                        passwordController.value.text.trim().toString();
                        try {
                          if (validateController.setValidateEmail(userEmail) ==
                              null &&
                              validateController
                                  .setValidatePassword(userPassword) ==
                                  null) {
                            UserCredential? userCredential =
                            await signInController.signInMethod(
                                userEmail, userPassword);
                            if (userCredential != null) {
                              if (userCredential.user!.emailVerified) {
                                User? user = FirebaseAuth.instance.currentUser;
                                final docSnapshot = await FirebaseFirestore
                                    .instance
                                    .collection('user_register')
                                    .doc(user?.uid ?? '')
                                    .get();

                                if (docSnapshot.exists) {
                                  UserModel userModel = UserModel.fromMap(docSnapshot.data()!);
                                  print("my data${userModel.toMap()}");
                                  // Save to SharedPreferences
                                  String userJson = jsonEncode(userModel.toMap());
                                  await LocalStorage.setData("userData", userJson);

                                  if(userModel.role == UserRole.Developer){
                                    Get.to(DeveloperPanel());
                                  }else if(userModel.role == UserRole.Driver){
                                    Get.to(DriverPanel());
                                  }else if(userModel.role == UserRole.Passenger){
                                    Get.to(MainScreen());
                                  }else{
                                    Get.to(OnBoardView());
                                  }

                                }
                              } else {
                                Get.snackbar(
                                  "Error",
                                  "Please verify your email before login",
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: RsColor.primaryThird,
                                  colorText: RsColor.white,
                                );
                              }
                            } else {
                              Get.snackbar(
                                "Error",
                                "Please try again",
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: RsColor.primaryThird,
                                colorText: RsColor.white,
                              );
                            }
                          }
                        } catch (e,s) {
                          log("Error $e");
                          log("Stack Trace $s");
                        }
                      },
                      height: 50,
                      width: Get.width * 1,
                      textStyle: Theme.of(context).textTheme.headlineSmall,
                      gradientColors: [
                        RsColor.primaryFirst.withOpacity(0.9),
                        RsColor.primarySecond.withOpacity(0.8)
                      ],
                      borderRadius: 10,
                    ),
                  ),
                  Common.customRichText(context, onTap: () {
                    log("Sign In");
                    Get.to(SignInView());
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
