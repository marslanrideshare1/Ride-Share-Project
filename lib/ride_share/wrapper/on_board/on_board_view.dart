import 'package:flutter/material.dart';
import 'package:ride_share/ride_share/auth/sign_up/sign_up_view.dart';
import 'package:ride_share/widgets/custom_button.dart';
import 'package:get/get.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            "assets/images/on_board_image.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Gradient Overlay
          Positioned.fill(
            bottom: 100.5, // Matches the height of your bottom container
            left: 0,
            right: 0,
            top: 0,
            child: Container(
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
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: 40,
                    right: 40,
                    child: Center(
                      child: Text("Reduce Public Traffic By Logically System"),
                    ),
                  ),
                  // Positioned(
                  //   child: AspectRatio(aspectRatio: 1,
                  //   child: Image.asset('assets/images/onboard_multi_image.png', scale: 1.0,)),
                  // )

                ],
              ),
            ),
          ),
          // Bottom Container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100.5,
              color: Colors.pink[100],
              // Add your bottom content here
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                child: CustomButton(text: "Next", onPressed: (){
                  Get.to(SignUpView());
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
