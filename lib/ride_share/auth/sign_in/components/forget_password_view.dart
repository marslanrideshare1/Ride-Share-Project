import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';
import 'package:get/get.dart';
import 'package:ride_share/ride_share/auth/sign_in/sign_in_controller.dart';
import 'package:ride_share/ride_share/auth/sign_up/components/sign_up_validate_controller.dart';
import 'package:ride_share/ride_share/auth/sign_up/sign_up_view.dart';
import 'package:ride_share/widgets/custom_button.dart';
import 'package:ride_share/widgets/custom_divider_row.dart';
import 'package:ride_share/widgets/custom_social_button.dart';
import 'package:ride_share/widgets/custom_square_button.dart';
import 'package:ride_share/widgets/custom_text_form_field.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../core/helper/common.dart';
import 'forget_password_controller.dart';


class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController emailController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();

  final ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());
  final SignUpValidateController validateController = Get.put(SignUpValidateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              "Forget Password",
              style: Theme.of(context)
                  .textTheme.headlineSmall,
            ),
            centerTitle: true,
            // pinned: true,
            leading: CustomSquareButton.squareButton(
              onTap: (){Get.to(SignUpView());},
              border: Border.all(color: Theme.of(context).colorScheme.onPrimary, width: 1.5),
              child: SvgPicture.asset("assets/images/back.svg",color: Theme.of(context).colorScheme.onPrimary,),
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  GradientText(
                    'Welcome to Ride Share Credential',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    gradientType: GradientType.linear,
                    colors: [
                      RsColor.primaryFirst,
                      RsColor.primarySecond
                    ],
                  ),
                  Text("Enter your email address to receive a verification/password reset link sent directly to your registered email inbox.", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),),
                  SizedBox(height: 15),
                  Obx(
                        ()=> CustomTextFormField(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        hintText: "Please! enter email...",
                        hintFadeDuration: Duration(seconds: 4),
                        mouseCursor: SystemMouseCursors.zoomOut,
                        onFieldSubmitted: (value) {Common.changeFocusOfField(context, emailFocusNode, null);},
                        onChanged: (value) => validateController.setValidateEmail(value),
                        onEditingComplete: () => validateController.clearError("emailValidate"),
                        // validator: (value) => validateController.setValidateEmail(value.toString()),
                        errorText:validateController.emailValidate.value.isEmpty ? null : validateController.emailValidate.value.toString()
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Obx(
              () => CustomButton(
            fullWidth: true,
            text: "Send Reset Link",
            isLoading: forgetPasswordController.isLoading,
            onPressed: () async {
              final userEmail = emailController.value.text.trim().toString();
              try {
                if(validateController.setValidateEmail(userEmail) == null){
                 await forgetPasswordController.forgetPasswordMethod(userEmail);
                  Get.snackbar(
                    "",
                    "Password reset email sent!",
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: RsColor.primaryThird,
                    colorText: RsColor.white,
                  );
                }else{
                  Get.snackbar(
                    "Error",
                    "Error password reset email sent!",
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: RsColor.primaryThird,
                    colorText: RsColor.white,
                  );
                }
              } catch (e) {Get.snackbar(
                "Catch Error",
                "Error password reset email sent!",
                snackPosition: SnackPosition.TOP,
                backgroundColor: RsColor.primaryThird,
                colorText: RsColor.white,
              );

              }
            },
            height: 50,
            textStyle: Theme.of(context).textTheme.headlineSmall,
            gradientColors: [
              RsColor.primaryFirst.withOpacity(0.9),
              RsColor.primarySecond.withOpacity(0.8),
            ],
            borderRadius: 10,
          ),
        ),
      ),

    );
  }
}