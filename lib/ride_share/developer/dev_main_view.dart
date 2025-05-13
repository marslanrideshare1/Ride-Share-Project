import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/local/local_storage.dart';
import 'package:ride_share/ride_share/auth/sign_in/sign_in_view.dart';

class DevMainView extends StatelessWidget {
  const DevMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dev"),
        centerTitle: true,
        backgroundColor: Colors.purple[100],
        actions: [
          IconButton(onPressed: ()async{
            try{
              await LocalStorage.clearAllData();
              await FirebaseAuth.instance.signOut();
              Get.to(SignInView());
            }catch (e, s){
              log("Error Logout $e");
              log("Error Stack Trace Logout $s");
            }
          }, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
