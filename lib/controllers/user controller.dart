import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project1/models/http%20helper%20%20model.dart';
import 'package:project1/models/product.dart';

import 'package:project1/models/user%20info.dart';

import '../models/journey info.dart';
import '../models/product history.dart';

import 'package:async_foreach/async_foreach.dart';

import '../services/settings services.dart';
class UserController extends GetxController{
  UserInfo userInfo = UserInfo();
  HttpHelper httpHelper = HttpHelper();
  JourneyInfo? journeyInfo ;
  Product? product ;
  bool isLoading = false;
  int currentPage =0 ;
  bool isShowBottmSheet = true;
  List<ProductHistory> productHistory =[];
  var  errorMessage = 'Make sure you are connected to the Internet';



  void setCurrentPage(int pageNumber){
    currentPage = pageNumber;
    update();
  }

  void  setUserInfoData(var userData){
    userInfo = userData ;
    update();
  }

  void getWallet()async{
    try{
      await httpHelper.getWallet();
    }catch(error){
      Get.snackbar('Error', errorMessage, backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2) ,);
    }

  }

  Future getjourney()async{

    try{
      var responseData= await httpHelper.getjourney();
      journeyInfo = JourneyInfo.init(responseData);
      update();
      return journeyInfo;
    }catch(error){
      Get.snackbar('Error', errorMessage, backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2) ,);
    }

  }

  Future getProductsHistory(String journeyId)async{
    isLoading = true;
    update();
    try{
      var responseData= await httpHelper.getProductsHistory(journeyId);
      productHistory.clear();

      update();
      if(responseData['success'])
        await   responseData['history'].forEach((element) async{
          productHistory.add(ProductHistory.init(responseData,element));
        });
      isLoading = false;
      update();
    }catch(error){
      isLoading = false;
       update();
      Get.snackbar('Error', errorMessage, backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2) ,);
    }

  }

  Future getProductsInThisDate(var date)async{

    List<ProductHistory> myList = [];
   productHistory.forEach((element) {
     String createdDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(element.createdDate));
     if(createdDate.toString() == date.toString())
       myList.add(element);

   });
  // print(myList.length);
    productHistory.clear();
    productHistory = myList;

    //print(productHistory.length);
   update();

  }
  clearProductHistory(){
    productHistory.clear();
    //update();
  }

  Future getUserInfo()async{
    try{
      var responseData= await httpHelper.getUserInfo();
      userInfo.walletValue = responseData['user']['walletId']['value'];
      userInfo.accountLevel = responseData['user']['accountLevel']['level'];
      userInfo.updatedAt = responseData['user']['updatedAt'];
      userInfo.walletId = responseData['user']['walletId']['_id'];
      userInfo.accountStatus =responseData['user']['accountStatus'];
      userInfo.withdrawalPin = responseData['user']['withdrawalPin'];
      if(responseData['user']['walletAddress'] != null){
        userInfo.walletAddress = responseData['user']['walletAddress'];
        userInfo.walletType = responseData['user']['walletType'];
      }
      update();
      return userInfo;
    }catch(error){
      Get.snackbar('Error', errorMessage, backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2) ,);
    }

  }


  Future placeOrder()async{
    isLoading = true;
    update();
    try{
      var responseData= await httpHelper.placeOrder(journeyInfo!.id);

      if(responseData['success'] == true) {

        product = Product.init(responseData);
        update();
      }else{
        product = Product(message: responseData['message']);
        product!.success = responseData['success'];
        update();
      }
      isLoading = false;
      update();
    }catch(error){
      isLoading = false;
       update();
      Get.snackbar('Error', errorMessage, backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2) ,);
    }


   // return userInfo;
  }




  Future submitOrder()async{
    isLoading = true;
    update();
    try{
      var responseData= await httpHelper.submitOrder();
      await getUserInfo();
      await getjourney();
      isLoading = false;
      update();
      return responseData['success'];
    }catch(error){
      isLoading = false;
      update();
      Get.snackbar('Error', errorMessage, backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2) ,);
    }

  //  userInfo.walletValue= responseData['newWallet']['value'];

    // return userInfo;
  }


  Future logOut()async{
    SettingsServices settingsServices = Get.find();
    isLoading = true;
    update();
    try{
      var responseData= await httpHelper.logOut();
      isLoading = false;
      settingsServices.sharedPreferences!.clear();
      print('The success is ${responseData['message']}');
      currentPage = 0;
      isLoading = false;
      update();
      Get.offAllNamed('/signUpPage');
    }catch(error){
      isLoading = false;
      update();
      Get.snackbar('Error', 'Make sure you are connected to the Internet', backgroundColor: Colors.red,icon: Icon(Icons.error_outline) , colorText: Colors.white ,duration: Duration(seconds: 2));
    }

  }
  





}