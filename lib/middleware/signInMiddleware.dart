
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/user%20controller.dart';
import 'package:project1/services/settings%20services.dart';

class SignInMiddleware extends GetMiddleware{

  @override
  // TODO: implement priority
  int? get priority => 2;
SettingsServices settingsServices = Get.find();
UserController userController = Get.find();
  @override
    RouteSettings?  redirect(String? route){
    if(settingsServices.sharedPreferences!.getString('userName') != null) {
      userController.setCurrentPage(0);
      return RouteSettings(name: '/frontPage');
    }
  }
}