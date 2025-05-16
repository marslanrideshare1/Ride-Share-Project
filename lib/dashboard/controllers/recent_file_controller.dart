import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../ride_share/auth/user/user_model.dart';

class RecentFileController extends GetxController{

  final _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;
  set setIsLoading(bool value) => _isLoading.value = value;

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final RxList<UserModel> totalUsers = <UserModel>[].obs;

  Future<void> fetchRecentFileMethod()async{
    try{
      setIsLoading = true;
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firebaseFirestore.collection("user_register").get();
      totalUsers.assignAll(snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).where((e)=> e.role.name != UserRole.Developer.name).toList());
      setIsLoading = false;
    }catch(e, s){
      setIsLoading = false;
      log("Error => $e");
      log("Error Stack Line => $s");
    }




  }


}