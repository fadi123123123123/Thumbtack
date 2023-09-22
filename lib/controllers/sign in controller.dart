import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project1/models/http%20helper%20%20model.dart';
import 'package:project1/models/user%20info.dart';

import '../services/settings services.dart';
import 'user controller.dart';
class SignInController extends GetxController{
  String errorMessage= "";
  bool isLoading = false;
  HttpHelper httpHelper = HttpHelper();
  UserInfo? userInfo;
  UserController userController = Get.find();
  SettingsServices settingsServices = Get.find();

  Future get () async{
    await Future.delayed(Duration(seconds: 3));
    return "ok";
  }

  void check(var myKey , String userName , String passWord)async{

  var isOk=  myKey.currentState!.validate();
    isLoading = true;
    update();

try{
  var respnose  = await httpHelper.signIn( userName ,  passWord);
  isLoading = false;
  update();
  if(respnose['success'] == true){

    userInfo = UserInfo.init(respnose);
    userController.userInfo = UserInfo.init(respnose);
    settingsServices.sharedPreferences!.setString('userName', userName);
    settingsServices.sharedPreferences!.setString('password', passWord);
    errorMessage="";
  }
  else{
    errorMessage = respnose['message'];
    print(errorMessage);
  }
}catch(error){
  isLoading = false;
  errorMessage = 'Make sure you are connected to the Internet';
  update();


}
  // var respnose  = await httpHelper.signIn( userName ,  passWord);
  //   isLoading = false;
  //   update();
  //   if(respnose['success'] == true){
  //
  //     userInfo = UserInfo.init(respnose);
  //     userController.userInfo = UserInfo.init(respnose);
  //     errorMessage="";
  //   }
  //   else{
  //     errorMessage = respnose['message'];
  //     print(errorMessage);
  //   }



    isOk =myKey.currentState!.validate();
    if(isOk){
      Get.offAllNamed('/landingPage');
    }else
      Get.snackbar('Error', errorMessage, backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2));

    update();
  }




}