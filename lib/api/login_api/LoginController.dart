import 'package:get/get.dart';
import 'package:pas1_mobile_11_pplg_02_01/database/DatabaseController.dart';

import '../../database/DatabaseModel.dart';
import 'LoginApiService.dart';


class LoginController extends GetxController{
  final databaseController = Get.put(DatabaseController());
  var authStatus = false.obs;
  var isLoading = false.obs;
  var token = "".obs;

  Future<void> auth(String username, String password) async {
    isLoading.value = true;
    var auth = await ApiService().loginAuth(username, password);
    if(auth.status == true){
      token.value = await auth.token!;
      isLoading.value = false;
      authStatus.value = true;
    }
    else if(auth.status == false){
      isLoading.value = false;
      authStatus.value = false;
    }
    else {
      isLoading.value = false;
      print("Error while logging in occurred");
    }
  }

  Future<void> register(String username, String password, String fullname, String email) async{
    var auth = await ApiService().registerUser(username, password, fullname, email);
    if(auth.status == true){
      isLoading.value = false;
      authStatus.value = true;
    }
    else if(auth.status == false){
      isLoading.value = false;
      authStatus.value = false;
    }
    else {
      isLoading.value = false;
      print("Error while registering occurred");
    }
  }

}