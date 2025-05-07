import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_share/core/theme/components/rs_color.dart';
import 'package:get/get.dart';
import 'package:ride_share/ride_share/auth/sign_up/sign_up_view.dart';
import 'package:ride_share/widgets/custom_button.dart';
import 'package:ride_share/widgets/custom_divider_row.dart';
import 'package:ride_share/widgets/custom_social_button.dart';
import 'package:ride_share/widgets/custom_square_button.dart';
import 'package:ride_share/widgets/custom_text_form_field.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../core/helper/common.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();

 final FocusNode emailFocusNode = FocusNode();
 final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              "Login",
              style: Theme.of(context)
                  .textTheme.headlineSmall,
            ),
            centerTitle: true,
            pinned: true,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  GradientText(
                    'Welcome to Ride Share Login.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    gradientType: GradientType.linear,
                    colors: [
                      RsColor.primaryFirst,
                      RsColor.primarySecond
                    ],
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    focusNode: emailFocusNode,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    hintText: "Please! enter email...",
                    hintFadeDuration: Duration(seconds: 4),
                    mouseCursor: SystemMouseCursors.zoomOut,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    hintText: "Please! enter password...",
                    hintFadeDuration: Duration(seconds: 4),
                    mouseCursor: SystemMouseCursors.zoomOut,
                    suffixIcon: Icons.visibility_off,
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    fullWidth: true,
                    text: "Login", onPressed: (){
                      Get.to(SignUpView());
                  },
                    height: 50,
                    width: Get.width * 1,
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                    gradientColors: [RsColor.primaryFirst.withOpacity(0.9), RsColor.primarySecond.withOpacity(0.8)],
                    borderRadius: 10,
                  ),
                  Common.customRichText(context, onTap: (){
                    log("Sign up");
                    Get.to(SignUpView());
                  }),

                  CustomDividerRow(),

                  CustomSocialButton(
                    buttonName: "RsFacebook",
                  ),
                  CustomSocialButton(
                    buttonName: "RsGoogle",
                    imageUrl: "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/crypto%2Fsearch%20(2).png?alt=media&token=24a918f7-3564-4290-b7e4-08ff54b3c94c",
                  ),
                  CustomSocialButton(
                    buttonName: "RsApple",
                    imageUrl: "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/socials%2Fapple-black-logo.png?alt=media&token=c44581fa-6fd2-4ae2-bd85-18bfbe6386d2",
                  ),
                  CustomSocialButton(
                    buttonName: "RsGithub",
                    imageUrl: "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/socials%2Fgithub.png?alt=media&token=c8a341e8-2f34-490c-a924-627b84fa3c43",
                  ),
                  CustomSocialButton(
                    buttonName: "RsTwitter",
                    imageUrl: "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/socials%2Ftwitter.png?alt=media&token=abd55874-2c77-4322-88e0-aa7598ee2a10",
                  ),
                  SizedBox(
                    height: 200,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}