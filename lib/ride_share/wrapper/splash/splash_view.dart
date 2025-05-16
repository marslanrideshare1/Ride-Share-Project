import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/ride_share/developer/developer_panel.dart';
import 'package:ride_share/ride_share/driver/driver_panel.dart';
import 'package:ride_share/ride_share/passenger/passenger_panel.dart';
import 'package:ride_share/ride_share/wrapper/splash/splash_controller.dart';

import '../on_board/on_board_view.dart';

class SplashView extends StatefulWidget {
   SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  User? user = FirebaseAuth.instance.currentUser;
  final SplashController splashController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), ()=> wrapper());
  }

  Future<void> wrapper() async {
   await splashController.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/simple_background2.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: AspectRatio(
              aspectRatio: 1, // Square aspect ratio
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  "assets/images/splash_logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
