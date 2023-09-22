import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/user%20controller.dart';
import 'package:project1/views/pages/sign%20up%20page.dart';

import 'package:get/get.dart';
import '../../controllers/password settings controller.dart';
import '../../controllers/sign up controller.dart';
import '../buttons/my button.dart';
import 'password setting page.dart';
FocusNode oldPinNode = FocusNode();
FocusNode newPinNode = FocusNode();
FocusNode retypePinNode= FocusNode();
TextEditingController oldPinController = TextEditingController();

TextEditingController newPinController = TextEditingController();

TextEditingController retypePinController = TextEditingController();
class WithdrawalPasswordSettingsPage extends StatefulWidget {
  WithdrawalPasswordSettingsPage({super.key});

  @override
  State<WithdrawalPasswordSettingsPage> createState() => _WithdrawalPasswordSettingsPageState();
}
int x= 0;
class _WithdrawalPasswordSettingsPageState extends State<WithdrawalPasswordSettingsPage> {
   GlobalKey<FormState> myKey = GlobalKey<FormState>();
   UserController userController =Get.find();
   PasswordSettingsController passwordSettingsController = Get.find();



  TextEditingController setWithdrawalPin = TextEditingController();

   @override
  void initState() {

   oldPinController.clear();
     newPinController.clear();
     retypePinController.clear();
     oldPinNode.unfocus();
     newPinNode.unfocus();
     retypePinNode.unfocus();

    super.initState();
  }


  Future get () async{
    await Future.delayed(Duration(seconds: 3));
    return 0;
  }

  void check()async{
    x = await get();
    setState(() {

    });
    var isOk = myKey.currentState!.validate();
  //  await Future.delayed(Duration(seconds: 3));
    myKey.currentState.reactive;

    if(isOk){
      Get.snackbar('ok', 'good');
    }else
      Get.snackbar('Not ok', 'Error');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 500.h, // Adjust the height as needed
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF333333),
                    Color.fromRGBO(70,71,70, 1),
                    Color.fromRGBO(113,85,85, 1), // 107,81,80
                    Color.fromRGBO(92,69,67, 1), // Top color
                    Colors.transparent, // Transpar/ Transparent color at the bottom
                  ],
                ),
              ),
            ),
          ),
          Center(
            child:  SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(height: 25.h,),

                  Container(
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                      //  color: Colors.yellow,
                        borderRadius: BorderRadius.circular(20).r,
                        color: Colors.yellow,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow[700]!.withOpacity(0.9),
                            // Shadow color
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(
                                0.w, 3.h), // S  offset: Offset(30,30),
                          ),
                        ]

                    ),
                    height: 50.h,
                    width: 200.w,
                    child: Row(
                      //  crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                              //  Get.back();
                            //    Get.offNamed('/frontPage');
                                userController.setCurrentPage(3);
                              },
                              child: Text('Password' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15.sp),),
                            ),
                            VerticalDivider(
                              color: Colors.black,
                              endIndent: 7.h,
                              thickness: 3.w,
                              indent:  7.h,
                            ),
                          ],
                        ),
                        Image.asset('assets/images/logo.png', color: Colors.black,width: 30.w,height: 30.h),

                      ],

                    ),
                  ),

                  SizedBox(height: 14.h,),


                  Container(
                    //height: 110.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(130).r,
                        color: Colors.yellow[700],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow[700]!.withOpacity(0.9),
                            // Shadow color
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(
                                0.w, 3.h), // S  offset: Offset(30,30),
                          ),
                        ]
                    ),
                    child: Image.asset('assets/images/logo.png' , color: Colors.black,),
                  ),

                  SizedBox(height: 14.h,),

                  
                  GetBuilder<PasswordSettingsController>(
                      builder: (_){
                        return passwordSettingsController.isLoading == true ? CircularProgressIndicator() : Container();
                      }
                  ),




                  Container(
                      padding: EdgeInsets.all(20.h),
                      margin: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20).r,


                      ),
                      child: GetBuilder<UserController>(
                        builder: (_){
                          return Form(
                            key: myKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(bottom: 15.h),
                                  child: Text("Withdrawal Pin" , style: TextStyle(color: Colors.white , fontSize: 20.sp , fontWeight: FontWeight.bold),),
                                ),
                                userController.userInfo.withdrawalPin != "null"?MyTextFormField(textEditingController: oldPinController, lebelText: "Old Pin" , icon: Icons.person_2_outlined,node: oldPinNode,):Container(),
                                SizedBox(height: 10.h,),
                                MyTextFormField(textEditingController: newPinController, lebelText: "New Pin" , icon: Icons.lock_outline, node: newPinNode,),

                                SizedBox(height: 10.h,),
                                MyTextFormField(textEditingController: retypePinController, lebelText: "Retype New Pin" , icon: Icons.lock_outline, node: retypePinNode,),
                              ],
                            ),
                          );
                        },
                      ),
                  ),

                  SizedBox(height: 15.h,),


                  // SizedBox(height: 10.h,),
                  myCustomButton("Confirm", ()async{ // TODO
             //       check();
                    print(userController.userInfo.withdrawalPin);

                    if(userController.userInfo.withdrawalPin == 'null'){
                      await passwordSettingsController.checkSaveWithdrawalPin(myKey: myKey , newPin: newPinController.text , ).then((value){
                        FocusScope.of(context).unfocus();
                        oldPinController.clear();
                        newPinController.clear();
                        retypePinController.clear();
                      });
                    }else{
                      await passwordSettingsController.checkChangeSaveWithdrawalPin(myKey: myKey , newPin: newPinController.text ,oldPin: oldPinController.text ).then((value){
                        FocusScope.of(context).unfocus();
                        oldPinController.clear();
                        newPinController.clear();
                        retypePinController.clear();
                      });
                    }









                  }),



              //    SizedBox(height: 15.h,),
                  SizedBox(height: 35.h,),
                ],

              ),
            ),
          ),
          // Icon arrow
          // Positioned(
          //   child: CircleAvatar(
          //     maxRadius: 22.h,
          //     backgroundColor: Colors.grey.shade500,
          //     child:  IconButton(
          //       onPressed: (){
          //         Get.back();
          //         oldPinController.clear();
          //         newPinController.clear();
          //         retypePinController.clear();
          //
          //         oldPinNode.unfocus();
          //         newPinNode.unfocus();
          //         retypePinNode.unfocus();
          //       },
          //       icon: Icon(Icons.arrow_back_ios_new_outlined),
          //       iconSize:25.h,
          //       color: Colors.black,
          //     ),
          //
          //
          //   ),
          //   top: 30.h,
          //   left: 5.w,
          // ),

        ],
      ),

    );
  }
}


class MyTextFormField extends StatelessWidget {
  var textEditingController;
  String? lebelText;
  IconData? icon;
  FocusNode? node;
  MyTextFormField({@required this.textEditingController , @required this.lebelText , @required this.icon , @required this.node});


  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0.r),
        //color: Colors.white,
      ),
      child: TextFormField(
        focusNode:node ,
        onFieldSubmitted: (value){
          FocusScope.of(context).requestFocus(
            node == oldPinNode ? newPinNode:node == newPinNode ? retypePinNode : null,
          );
        },
        obscureText: lebelText == "password"?true : false,
        controller: textEditingController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          //   prefixIcon: Icon(icon , size: 36,),
          labelText: lebelText,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          hintStyle: TextStyle(
              color: Colors.white
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty || value.trim().isEmpty) {
            return '${lebelText} is required';
          }
          if(textEditingController == retypePinController && retypePinController.text != newPinController.text){
            return 'password does not match';
          }
          return null;
        },
        onSaved: (value){
          //   String s= signUpController.strigTrim(value!);
          //   print(s);
        },
      ),
    );

  }
}




GestureDetector myCustomButton(String text , Function function){
  return GestureDetector(
    onTap:(){
      function();
    },
    child: Container(
        height: 35.h,
        width: 250.w,
        child: Center(child: Text(text , style: TextStyle(color: Colors.white , fontSize: 20.sp),)),
        decoration: BoxDecoration(
          //       color: Colors.black,
          borderRadius: BorderRadius.circular(20).r,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF333333),
              Color.fromRGBO(70,71,70, 1),
              Color.fromRGBO(113,85,85, 1), // 107,81,80
              Color.fromRGBO(92,69,67, 1), // Top color
              Colors.transparent, // Transpar// Transparent color at the bottom
            ],
          ),
          border:Border.all(
              color: Colors.white,
              width: 2
          ),
        )
    ),
  );
}
