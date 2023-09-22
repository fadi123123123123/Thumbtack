import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:project1/models/user%20info.dart';

import '../controllers/user controller.dart';

class HttpHelper {
    String path='https://thumbtack.life';

  signIn (String userName , String passWord)async{
    UserInfo userInfo;
    final url = Uri.parse('$path/api/signin');
    final headers = {'Content-Type': 'application/json'};
    final data = {'username': userName, 'password': passWord};
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    final responseData = jsonDecode(response.body);
    return responseData;


  }


  signUp (String userName ,String email,String passWord , String adminRef , String phone)async{
    print(adminRef);
    UserInfo userInfo;
    final url = Uri.parse('$path/api/signup');
    final headers = {'Content-Type': 'application/json' , };
    final data = {
      'username': userName,
      'password': passWord,
      'email' : email,
      'adminRef' :adminRef,
      'phone' : phone,
    };
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    final responseData = jsonDecode(response.body);
    return responseData;

  }



   getWallet ()async{
    final url = Uri.parse('$path/api/get-user-wallet');
    var response = await http.get(url);
      var responseData = jsonDecode(response.body);
      print(responseData['success']);

    //  print(response.statusCode);
  }

  getjourney ()async{

    UserController userController = Get.find();
    final url = Uri.parse('$path/api/get-journey');

     var token =userController.userInfo.token;




    Map<String, String> headers = {
      'Cookie': 'authorization=${token}',
      'Content-Type': 'application/json'
    };

    final response = await http.get(url, headers: headers);



    var responseData = jsonDecode(response.body);
    print(responseData);
    return responseData;


  }

  getProductsHistory (String journeyId)async{

    UserController userController = Get.find();
    final url = Uri.parse('$path/api/get-journey-history?journeyId=${journeyId}');

    var token =userController.userInfo.token;



    Map<String, String> headers = {
      'Cookie': 'authorization=${token}',
      'Content-Type': 'application/json'
    };


   // final response = await http.post(url, headers: headers, body: jsonEncode(data));
    final response = await http.get(url , headers: headers);



    var responseData = jsonDecode(response.body);
   // print(responseData);
    return responseData;


  }

  getUserInfo ()async{ // TODO
    UserController userController = Get.find();
    final url = Uri.parse('$path/api/get-user-info');

    var token =userController.userInfo.token;


    Map<String, String> headers = {
      'Cookie': 'authorization=${token}',
      'Content-Type': 'application/json'
    };

    final response = await http.get(url, headers: headers);


    var responseData = jsonDecode(response.body);
    print(responseData['success']);
    return responseData;


  }

  changePassword(String oldPassword , String newPassword)async{
    UserController userController = Get.find();

    final url = Uri.parse('$path/api/change-password');
    var token =userController.userInfo.token;

    Map<String, String> headers = {
      'Cookie': 'authorization=${token}',
      'Content-Type': 'application/json'
    };

    final data = {
      'oldPassword': oldPassword,
      'newPassword':newPassword,

    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    final responseData = jsonDecode(response.body);

    return responseData;


  }


  placeOrder(String journeyId)async{
    UserController userController = Get.find();

    final url = Uri.parse('$path/api/place-order');
    var token =userController.userInfo.token;


    Map<String, String> headers = {
      'Cookie': 'authorization=${token}',
      'Content-Type': 'application/json'
    };

    final data = {
      'journeyId': journeyId,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

      final responseData = jsonDecode(response.body);
      return responseData;



  }


  submitOrder()async{
    UserController userController = Get.find();

    final url = Uri.parse('$path/api/submit-order');
    var token =userController.userInfo.token;


    Map<String, String> headers = {
      'Cookie': 'authorization=${token}',
      'Content-Type': 'application/json'
    };


    final response = await http.post(
      url,
      headers: headers,
    );

    final responseData = jsonDecode(response.body);
    return responseData;



  }


  saveWithDrawalPin(String withdrawalPin)async{
    UserController userController = Get.find();

    final url = Uri.parse('$path/api/save-withdrawal-pin');
    var token =userController.userInfo.token;


    Map<String, String> headers = {
      'Cookie': 'authorization=${token}',
      'Content-Type': 'application/json'
    };


    final data = {
      'pin': withdrawalPin,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(data),
    );

    final responseData = jsonDecode(response.body);
    return responseData;



  }

    changeWithDrawalPin(String newWithdrawalPin , String oldWithdrawalPin)async{
    print(newWithdrawalPin);
    print(oldWithdrawalPin);
      UserController userController = Get.find();

      final url = Uri.parse('$path/api/change-withdrawal-pin');
      var token =userController.userInfo.token;


      Map<String, String> headers = {
        'Cookie': 'authorization=${token}',
        'Content-Type': 'application/json'
      };


      final data = {
        'oldPin': oldWithdrawalPin,
        'newPin' : newWithdrawalPin
      };

      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data),
      );

      final responseData = jsonDecode(response.body);
      return responseData;



    }


    logOut ()async{

      UserController userController = Get.find();
      final url = Uri.parse('$path/api/logout');

      var token =userController.userInfo.token;


      Map<String, String> headers = {
        'Cookie': 'authorization=${token}',
      };

      final response = await http.delete(url, headers: headers);


      var responseData = jsonDecode(response.body);
      print(responseData['success']);
      return responseData;


    }


    saveWalletAddress(String address , String cardType)async{
      UserController userController = Get.find();

      final url = Uri.parse('$path/api/save-wallet-address');
      var token =userController.userInfo.token;


      Map<String, String> headers = {
        'Cookie': 'authorization=${token}',
        'Content-Type': 'application/json'
      };


      final data = {
        'address': address,
        'cardType' : cardType
      };

      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data),
      );

      final responseData = jsonDecode(response.body);
      return responseData;



    }



    withdraw(String withdrawalPin)async{
      UserController userController = Get.find();

      final url = Uri.parse('$path/api/withdrawal-wallet');
      var token =userController.userInfo.token;


      Map<String, String> headers = {
        'Cookie': 'authorization=${token}',
        'Content-Type': 'application/json'
      };


      final data = {
        'password': withdrawalPin,
      };

      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data),
      );

      final responseData = jsonDecode(response.body);
      return responseData;



    }



}