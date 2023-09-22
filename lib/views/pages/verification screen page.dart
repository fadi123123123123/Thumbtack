import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/sign%20up%20controller.dart';

import '../buttons/my button.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
FocusNode userNameNode1 = FocusNode();
FocusNode passwordNode1 = FocusNode();
FocusNode phoneNode = FocusNode();
FocusNode referrallCodeNode = FocusNode();

class VerificationScreenPage extends StatefulWidget {
  VerificationScreenPage({super.key});

  @override
  State<VerificationScreenPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<VerificationScreenPage> {


  GlobalKey myKey = GlobalKey<FormState>();

  TextEditingController verificationController = TextEditingController();

  @override

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
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
              height: 300, // Adjust the height as needed
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(113,85,85, 1), // 107,81,80
                    Color.fromRGBO(92,69,67, 1),
                    Color(0xFF333333),
                    Color.fromRGBO(70,71,70, 1),
                    // Top color
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Center(
            child:  SingleChildScrollView(
              child: Column(

                children: [
                  Container(
                    height: 250.h,
                    width: double.infinity,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(child: Image.asset('assets/images/logo.png' ,width: 150.w,height: 150.h,)),
                        Container(
                          child: Image.asset('assets/images/logo_text.png' ,
                            width: 270.w,
                            height: 50.h,
                            color: Colors.white,


                          ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  keyboardType: TextInputType.number,
                  textStyle: TextStyle(color: Colors.white),
                  pinTheme: PinTheme.defaults(
                      fieldWidth: 45.w,
                      fieldHeight: 45.h,
                      shape: PinCodeFieldShape.circle,
                      activeFillColor: Colors.white,
                      activeColor: Colors.blue,
                      inactiveFillColor: Colors.white,
                      inactiveColor: Colors.white,
                      selectedColor: Colors.pink,
                      fieldOuterPadding: const EdgeInsets.all(5).w),
                  controller: verificationController,
                  onChanged: (String value) {},
                ),
                  // SizedBox(height: 10.h,),
                  SizedBox(height: 10.h,),
                  Text('Code has been send to +123' , style: TextStyle(color: Colors.white , fontSize: 15.sp),),


                  SizedBox(height: 100.h,),

                  MyButton.myCustomButton("Confirm", (){
                    //signUpController.check(myKey);
                    print(verificationController.text);
                    verificationController.clear();
                  }),







                ],

              ),
            ),
          ),
          Positioned(
            child: CircleAvatar(
              maxRadius: 22.h,
              backgroundColor: Colors.grey.shade500,
              child:  IconButton(
                onPressed: (){
                  Get.back();
                  verificationController.clear();

                },
                icon: Icon(Icons.arrow_back_ios_new_outlined),
                iconSize:25.h,
                color: Colors.black,
              ),


            ),
            top: 30.h,
            left: 10.w,
          ),
        ],
      ),

    );
  }
}
