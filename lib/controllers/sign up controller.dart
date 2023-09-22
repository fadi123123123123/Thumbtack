import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/http helper  model.dart';
import '../models/user info.dart';
import '../services/settings services.dart';
import 'user controller.dart';

class SignUpController extends GetxController{

  String errorMessage= "";
  bool isLoading = false;
  HttpHelper httpHelper = HttpHelper();
  UserInfo? userInfo;
  UserController userController = Get.find();
  SettingsServices settingsServices = Get.find();



  void check(var myKey , String userName ,String email,String passWord , String adminRef , String phone , String confirmPassword)async{

    var isOk=  myKey.currentState!.validate();


      try{
        if(passWord == confirmPassword) {
          isLoading = true;
          errorMessage = '';
          update();
          var respnose = await httpHelper.signUp(
              userName, email, passWord, adminRef, phone);
          // var respnose  = await httpHelper.signIn( userName ,  passWord);
          isLoading = false;
          update();
          if (respnose['success'] == true) {
            print('ok');
            var respnose = await httpHelper.signIn(userName, passWord);
            userInfo = UserInfo.init(respnose);
            settingsServices.sharedPreferences!.setString('userName', userName);
            settingsServices.sharedPreferences!.setString('password', passWord);
            userController.userInfo = UserInfo.init(respnose);
            print(userInfo!.email);
            errorMessage = "";
          }
          else {
            errorMessage = respnose['message'];
            print(respnose['message']);
            print(errorMessage);
          }
          isOk =myKey.currentState!.validate();
        }
        else{
          errorMessage = 'Password does not match';
          update();
          Get.snackbar('Error', errorMessage, backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2) ,);

          return ;
        }
      }catch(error){
        isLoading = false;
        errorMessage = 'Make sure you are connected to the Internet';
        update();
      }





    if(isOk){
      Get.offAllNamed('/landingPage');
    }else{
    errorMessage!= '' ? Get.snackbar('Error', errorMessage, backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2) ,) :null;
    }


    update();
  }





}