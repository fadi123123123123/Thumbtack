
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/services/settings%20services.dart';

class ErrorMiddleWare extends GetMiddleware{

  @override
  // TODO: implement priority
  int? get priority => 1;
  SettingsServices settingsServices = Get.find();
  @override
  RouteSettings?  redirect(String? route){
    if(settingsServices.isError == true)
      return RouteSettings(name: '/errorPage');

  }
}