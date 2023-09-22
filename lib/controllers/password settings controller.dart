import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/user%20controller.dart';

import '../models/http helper  model.dart';
import '../services/settings services.dart';
import '../views/pages/password setting page.dart';
import '../views/pages/withdrawal password settings page.dart';


class PasswordSettingsController extends GetxController{
  HttpHelper httpHelper = HttpHelper();
  String errorMessage = '';
  bool isLoading = false;
  UserController userController = Get.find();
  SettingsServices settingsServices = Get.find();
  Future check(var myKey , String oldPassword , String newPassword)async {

    var isOk = myKey.currentState!.validate();



  //  isOk = myKey.currentState!.validate();

    if (isOk) {
      isLoading = true;
      update();

      try{
        var respnose = await httpHelper.changePassword(oldPassword, newPassword);
        var username= await settingsServices.sharedPreferences!.getString('userName');
        await settingsServices.sharedPreferences!.clear();
        await settingsServices.sharedPreferences!.setString('userName', username!);
        await settingsServices.sharedPreferences!.setString('password', newPassword);
        isLoading = false;
        update();
        if(respnose['success'] == true) {
          Get.defaultDialog(
              backgroundColor: Colors.grey.shade700,
              title: "Thumbtack",
              titleStyle: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp),
              middleText: "",
              actions: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //    Text("Thumbtack" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25.sp),),
                    Text("Password has updated successfully", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),),
                    Image.asset('assets/images/password_setting_successful.png',
                      color: Colors.white, scale: 2.h,),
                  ],
                ),
              ],
              onCancel: () {
                oldPasswordController.clear();
                newPasswordController.clear();
                reconfirmPasswordController.clear();
                reconfirmPasswordNode.unfocus();
                //Get.back();
              }
          );

        }else{
          Get.defaultDialog(
              backgroundColor: Colors.grey.shade700,
              title: "Thumbtack",
              titleStyle: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp),
              middleText: "",
              actions: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //    Text("Thumbtack" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25.sp),),
                    Text(respnose['message'], style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),),
                    Image.asset('assets/images/password_setting_unsuccessful.png',
                      color: Colors.white, scale: 3.h,),
                  ],
                ),
              ],
              onCancel: () {
                oldPasswordController.clear();
                newPasswordController.clear();
                reconfirmPasswordController.clear();
                reconfirmPasswordNode.unfocus();

              }
          );
        }
      }catch(error){
        isLoading = false;
        update();
        Get.snackbar('Error', 'Make sure you are connected to the Internet', backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2));
      }

    }

    update();


  }



  // changePassword(String oldPassword , String newPassword)async{
  //   try{
  //     var response = await httpHelper.changePassword(oldPassword, newPassword);
  //
  //   }catch(error){
  //     Get.snackbar('Error', 'Make sure you are connected to the Internet', backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2));
  //
  //   }
  //
  // }


  Future saveWithDrawalPin(String withdrawalPin)async{
    UserController userController = Get.find();
    isLoading = true;
    update();
    try{
      var responseData= await httpHelper.saveWithDrawalPin(withdrawalPin);
      if(responseData['success']){
        await userController.getUserInfo();
      }
      isLoading = false;
      update();
      return responseData;

    }catch(error){
      isLoading = false;
      update();
      Get.snackbar('Error', 'Make sure you are connected to the Internet', backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2));

    }


  }

  Future checkSaveWithdrawalPin({var myKey , String? newPin , String oldPin=''})async {

    var isOk = myKey.currentState!.validate();

  //  isOk = myKey.currentState!.validate();

    if (isOk) {

      isLoading = true;
      update();
    try{
      var respnose = await httpHelper.saveWithDrawalPin(newPin!);
      if(respnose['success'] == true)
        await userController.getUserInfo();
      isLoading = false;
      update();
      if(respnose['success'] == true){
        Get.defaultDialog(
            backgroundColor: Colors.grey.shade700,
            title: "Thumbtack",
            titleStyle: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp),
            middleText: "",
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //    Text("Thumbtack" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25.sp),),
                  Text("Pin has updated successfully", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp),),
                  Image.asset('assets/images/password_setting_successful.png',
                    color: Colors.white, scale: 2.h,),
                ],
              ),
            ],
            onCancel: () {
              oldPinController.clear();
              newPinController.clear();
              retypePinController.clear();
              //     Get.back();
            }
        );
      }else{
        Get.defaultDialog(
            backgroundColor: Colors.grey.shade700,
            title: "Thumbtack",
            titleStyle: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp),
            middleText: "",
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //    Text("Thumbtack" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25.sp),),
                  Text(respnose['message'], style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp),),
                  Image.asset('assets/images/password_setting_unsuccessful.png',
                    color: Colors.white, scale: 3.h,),
                ],
              ),
            ],
            onCancel: () {
              oldPinController.clear();
              newPinController.clear();
              retypePinController.clear();
            }
        );
      }
    }catch(error){
      isLoading = false;
      update();
      Get.snackbar('Error', 'Make sure you are connected to the Internet', backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2));
    }

    }

    update();
  }

  Future checkChangeSaveWithdrawalPin({var myKey , String? newPin , String? oldPin})async {

    var isOk = myKey.currentState!.validate();

  //  isOk = myKey.currentState!.validate();
    if (isOk) {
      isLoading = true;
      update();

     try{
       var respnose = await httpHelper.changeWithDrawalPin(newPin!,oldPin!);
       if(respnose['success'] == true)
         await userController.getUserInfo();
       isLoading = false;
       update();
       if(respnose['success'] == true){
         Get.defaultDialog(
             backgroundColor: Colors.grey.shade700,
             title: "Thumbtack",
             titleStyle: TextStyle(color: Colors.white,
                 fontWeight: FontWeight.bold,
                 fontSize: 25.sp),
             middleText: "",
             actions: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   //    Text("Thumbtack" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25.sp),),
                   Text("Pin has updated successfully", style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 15.sp),),
                   Image.asset('assets/images/password_setting_successful.png',
                     color: Colors.white, scale: 2.h,),
                 ],
               ),
             ],
             onCancel: () {
               oldPinController.clear();
               newPinController.clear();
               retypePinController.clear();
               retypePinNode.unfocus();
               //     Get.back();
             }
         );
       }else{
         Get.defaultDialog(
             backgroundColor: Colors.grey.shade700,
             title: "Thumbtack",
             titleStyle: TextStyle(color: Colors.white,
                 fontWeight: FontWeight.bold,
                 fontSize: 25.sp),
             middleText: "",
             actions: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   //    Text("Thumbtack" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25.sp),),
                   Text(respnose['message'], style: TextStyle(color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 15.sp),),
                   Image.asset('assets/images/password_setting_unsuccessful.png',
                     color: Colors.white, scale: 3.h,),
                 ],
               ),
             ],
             onCancel: () {
               oldPinController.clear();
               newPinController.clear();
               retypePinController.clear();
               retypePinNode.unfocus();
             }
         );
       }
     }catch(error){
       isLoading = false;
       update();
       Get.snackbar('Error', 'Make sure you are connected to the Internet', backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2));
     }

    }

    update();
  }



  Future checkSaveWalletAddress(var myKey , String address , String cardType )async {
    print(address);

    var isOk = myKey.currentState!.validate();

    //  isOk = myKey.currentState!.validate();

    if (isOk) {
      isLoading = true;
      update();

      try{
        var respnose = await httpHelper.saveWalletAddress(address.toString() , cardType.toString());
        if(respnose['success'] == true)
          await userController.getUserInfo();
        isLoading = false;
        update();
        if(respnose['success'] == true){
          Get.defaultDialog(
              backgroundColor: Colors.grey.shade700,
              title: "Thumbtack",
              titleStyle: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp),
              middleText: "",
              actions: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //    Text("Thumbtack" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25.sp),),
                    Text("Wallet address has updated successfully", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),),
                    Image.asset('assets/images/password_setting_successful.png',
                      color: Colors.white, scale: 2.h,),
                  ],
                ),
              ],
              onCancel: () {//     Get.back();

              }
          );
        }else{
          Get.defaultDialog(
              backgroundColor: Colors.grey.shade700,
              title: "Thumbtack",
              titleStyle: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp),
              middleText: "",
              actions: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //    Text("Thumbtack" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25.sp),),
                    Text(respnose['message'], style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),),
                    Image.asset('assets/images/password_setting_unsuccessful.png',
                      color: Colors.white, scale: 3.h,),
                  ],
                ),
              ],
              onCancel: () {

              }
          );
        }
      }catch(error){
        isLoading = false;
        update();
        Get.snackbar('Error', 'Make sure you are connected to the Internet', backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2));
      }

    }

    update();
  }


  Future checkWithdraw(var myKey , String withdrawalPin )async {
   if(userController.userInfo.withdrawalPin == 'null'){
     Get.defaultDialog(
         barrierDismissible: false,
         backgroundColor: Colors.grey.shade700,
         title: "Thumbtack",
         titleStyle: TextStyle(color: Colors.white,
             fontWeight: FontWeight.bold,
             fontSize: 25.sp),
         middleText: "",
         actions: [
           Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               //    Text("Thumbtack" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25.sp),),
               Text("Please set the withdrawal pin first and try again.", style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 15.sp),),

               SizedBox(height: 10.h,),
               InkWell(
                 onTap: (){
                   userController.setCurrentPage(5);
                   Get.back();
                 },
                child: Text('Click here to set withdrawal pin' ,style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp),),
               ),


               Image.asset('assets/images/password_setting_successful.png',
                 color: Colors.white, scale: 2.h,),
             ],
           ),
         ],
         onCancel: () {//     Get.back();
         }
     );
     return ;
   }


    var isOk = myKey.currentState!.validate();

    //  isOk = myKey.currentState!.validate();

    if (isOk) {
      isLoading = true;
      update();

      try{
        var respnose = await httpHelper.withdraw(withdrawalPin.toString()) ;
        // if(respnose['success'] == true)
        //   await userController.getUserInfo();
        isLoading = false;
        update();
        if(respnose['success'] == true){
          Get.defaultDialog(
              barrierDismissible: false,
              backgroundColor: Colors.grey.shade700,
              title: "Thumbtack",
              titleStyle: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp),
              middleText: "",
              actions: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //    Text("Thumbtack" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25.sp),),
                    Text(respnose['message'], style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),),
                    Image.asset('assets/images/password_setting_successful.png',
                      color: Colors.white, scale: 2.h,),
                  ],
                ),
              ],
              onCancel: () {
                userController.setCurrentPage(0);
                Get.back();
              }
          );
        }else{
          Get.defaultDialog(
              barrierDismissible: false,
              backgroundColor: Colors.grey.shade700,
              title: "Thumbtack",
              titleStyle: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp),
              middleText: "",
              actions: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //    Text("Thumbtack" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 25.sp),),
                    Text(respnose['message'], style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),),
                    Image.asset('assets/images/password_setting_unsuccessful.png',
                      color: Colors.white, scale: 3.h,),
                  ],
                ),
              ],
              onCancel: () {

              }
          );
        }
      }catch(error){
        isLoading = false;
        update();
        Get.snackbar('Error', 'Make sure you are connected to the Internet', backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2));
      }

    }

    update();
  }

  }