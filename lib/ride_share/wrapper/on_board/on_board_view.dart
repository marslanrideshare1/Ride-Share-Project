import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/ride_share/auth/sign_up/sign_up_view.dart';
import 'package:ride_share/ride_share/wrapper/on_board/components/custom_dialog_card.dart';
import 'package:ride_share/widgets/custom_button.dart';
import 'on_board_controller.dart';
import 'dart:io' show Platform;


class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardController());


    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        if(kIsWeb) {
          controller.kIsWebHandle(context);
        } else {
          controller.manualDevTapHandle(context);
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(child: Text("On Board View", style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white))),
            // Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Center(
                child: CustomButton(
                  text: "Next",
                  onPressed: () {
                    Get.to(()=> SignUpView());
                  }


                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
