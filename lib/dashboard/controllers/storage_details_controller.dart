import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../ride_share/auth/user/user_model.dart';

class StorageDetailsController extends GetxController{

  final _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;
  set setIsLoading(bool value) => _isLoading.value = value;

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final RxList<UserModel> totalUsers = <UserModel>[].obs;
  final RxList<UserModel> approvedUser = <UserModel>[].obs;
  final RxList<UserModel> pendingUser = <UserModel>[].obs;

  final RxList<UserModel> totalDriver = <UserModel>[].obs;
  final RxList<UserModel> pendingDriver = <UserModel>[].obs;

  final RxList<UserModel> totalPassenger = <UserModel>[].obs;
  final RxList<UserModel> pendingPassenger = <UserModel>[].obs;



  Future<void> fetchUserStorageDetailsMethod()async{
    try{
      setIsLoading = true;
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firebaseFirestore.collection("user_register").get();
      totalUsers.assignAll(snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).where((e)=> e.role.name != UserRole.Developer.name).toList());
      approvedUser.assignAll(snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).where((approvedUser)=> approvedUser.requestStatus.name == UserRequest.Approved.name && approvedUser.role.name != UserRole.Developer.name,).toList());
      pendingUser.assignAll(snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).where((pendingUser)=> pendingUser.requestStatus.name == UserRequest.Pending.name && pendingUser.role.name != UserRole.Developer.name,).toList());
      // Driver
      totalDriver.assignAll(snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).where((driver)=> driver.role.name == UserRole.Driver.name && driver.role.name != UserRole.Developer.name).toList());
      pendingDriver.assignAll(snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).where((pendingDriver)=> pendingDriver.role.name == UserRole.Driver.name && pendingDriver.requestStatus.name == UserRequest.Pending.name && pendingDriver.role.name != UserRole.Developer.name  ).toList());
      // Passenger
      totalPassenger.assignAll(snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).where((passenger)=> passenger.role.name == UserRole.Passenger.name && passenger.role.name != UserRole.Developer.name).toList());
      pendingPassenger.assignAll(snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).where((pendingPassenger)=> pendingPassenger.role.name == UserRole.Passenger.name && pendingPassenger.requestStatus.name == UserRequest.Pending.name && pendingPassenger.role.name != UserRole.Developer.name).toList());
      setIsLoading = false;
    }catch(e, s){
      setIsLoading = false;
      log("Error => $e");
      log("Error Stack Line => $s");
    }




  }


}