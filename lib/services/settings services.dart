import 'package:get/get.dart';
import 'package:project1/controllers/sign%20up%20controller.dart';
import 'package:project1/controllers/user%20controller.dart';
import 'package:project1/models/http%20helper%20%20model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/journey info.dart';
import '../models/user info.dart';

class SettingsServices extends GetxService{
  SharedPreferences? sharedPreferences ;
   bool isError = false;

  JourneyInfo? journeyInfo ;
  UserController userController = Get.put(UserController());

  HttpHelper httpHelper = HttpHelper();


  Future initSignIn(String userName , String passWord)async{
    try{
   var responseSignIn= await httpHelper.signIn(userName.toString(), passWord.toString());
   userController.userInfo =await UserInfo.init(responseSignIn);
   var responseData= await httpHelper.getjourney();
   userController.journeyInfo = JourneyInfo.init(responseData);

    }catch(error){
      isError = true;
    }

  }

  Future<SettingsServices> init()async{
    sharedPreferences = await SharedPreferences.getInstance();

    if(sharedPreferences!.getString('userName') != null){
      var userName = sharedPreferences!.getString('userName');
      var password = sharedPreferences!.getString('password');
      print(password);
      await initSignIn(userName!, password!);
    }
    return this;
  }
}