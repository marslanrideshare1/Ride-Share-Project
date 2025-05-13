// ignore_for_file: file_names, unused_field

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ride_share/dashboard/screens/main/main_screen.dart';
import 'package:ride_share/local/local_storage.dart';
import 'package:ride_share/ride_share/auth/user/user_model.dart';
import 'package:ride_share/ride_share/driver/driver_main_view.dart';
import 'package:ride_share/ride_share/passenger/passenger_main_view.dart';
import 'package:ride_share/ride_share/wrapper/on_board/on_board_view.dart';

import '../../developer/dev_main_view.dart';

class SplashController extends GetxController {
  getUserData()async{
   String user= await LocalStorage.getData("userData");
   if(user.isNotEmpty){
     UserModel userModel=UserModel.fromMap(jsonDecode(user));
     if(userModel.role==UserRole.Developer){
       Get.offAll(() => DevMainView());
     }else if(userModel.role == UserRole.Driver){
       Get.offAll(() => DriverMainView());
     }else if(userModel.role == UserRole.Passenger){
       Get.offAll(() => MainScreen());

     }else{
       Get.offAll(() => OnBoardView());
     }
   }else{
     Get.offAll(() => OnBoardView());
     // user is not logged in - redirect to welcome screen
   }
  }
  // final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //
  // Future<List<QueryDocumentSnapshot<Object?>>> getUserData(String uId) async {
  //   final QuerySnapshot userData =
  //   await firebaseFirestore.collection('user_register').where('uId', isEqualTo: uId).get();
  //   return userData.docs;
  // }
}