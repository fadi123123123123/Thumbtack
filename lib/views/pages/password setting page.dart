import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/user%20controller.dart';
import 'package:project1/models/user%20info.dart';
import 'package:project1/views/pages/sign%20up%20page.dart';

import 'package:get/get.dart';

import '../../controllers/password settings controller.dart';
import '../../controllers/sign up controller.dart';
import '../buttons/my button.dart';
FocusNode oldPasswordNode = FocusNode();
FocusNode newPasswordNode = FocusNode();
FocusNode reconfirmPasswordNode = FocusNode();
TextEditingController oldPasswordController = TextEditingController();
TextEditingController newPasswordController = TextEditingController();
TextEditingController reconfirmPasswordController = TextEditingController();
class PasswordSettingsPage extends StatefulWidget {
  PasswordSettingsPage({super.key});

  @override
  State<PasswordSettingsPage> createState() => _PasswordSettingsPageState();
}

class _PasswordSettingsPageState extends State<PasswordSettingsPage> {
  UserController userController = Get.find();

  GlobalKey myKey = GlobalKey<FormState>();


  PasswordSettingsController passwordSettingsController = Get.find();

@override
  void dispose() {

  oldPasswordController.clear();
  newPasswordController.clear();
  reconfirmPasswordController.clear();

  oldPasswordNode.unfocus();
  newPasswordNode.unfocus();
  reconfirmPasswordNode.unfocus();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
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
                  GetBuilder<UserController>(
                    builder: (_){
                      return userController.isLoading == true ? CircularProgressIndicator() : Container();
                    },
                  ),

                  SizedBox(height: 25.h,),

                  Padding(
                    padding: EdgeInsets.only(top: 0.h),
                    child: Container(
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

                          Image.asset('assets/images/logo.png',width: 30.w,height: 30.h, color: Colors.black,),
                          Row(
                            children: [

                              VerticalDivider(
                                color: Colors.black,
                                endIndent: 7.h,
                                thickness: 3.w,
                                indent:  7.h,
                              ),
                              GestureDetector(
                                onTap: (){
                                  //Get.toNamed('/withdrawalPasswordSettingsPage');
                                  userController.setCurrentPage(5);

                                },
                                child: Text('Withdrawal Pin' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15.sp ),),
                              ),
                            ],
                          ),
                        ],

                      ),
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
                      child: Form(
                        key: myKey,
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(bottom: 15.h),
                              child: Text("Securety Center" , style: TextStyle(color: Colors.white , fontSize: 20.sp ,fontWeight: FontWeight.bold),),
                            ),
                            MyTextFormField(textEditingController: oldPasswordController, lebelText: "Old Password" , icon: Icons.person_2_outlined,node: oldPasswordNode,),
                            SizedBox(height: 10.h,),
                            MyTextFormField(textEditingController: newPasswordController, lebelText: "New Password" , icon: Icons.lock_outline, node: newPasswordNode,),

                            SizedBox(height: 10.h,),
                            MyTextFormField(textEditingController: reconfirmPasswordController, lebelText: "Reconfirm New Password" , icon: Icons.lock_outline, node: reconfirmPasswordNode,),
                          ],
                        ),
                      )
                  ),

                  SizedBox(height: 15.h,),


                  // SizedBox(height: 10.h,),
                  myCustomButton("Confirm", ()async{
               // await    userController.changePassword(oldPasswordController.text, newPasswordController.text);
            //        check(myKey);
                    passwordSettingsController.check(myKey, oldPasswordController.text, newPasswordController.text).then((value){
                      FocusScope.of(context).unfocus();
                      oldPasswordController.clear();
                      newPasswordController.clear();
                      reconfirmPasswordController.clear();
                    });






                  }),
                  SizedBox(height: 35.h,),




                ],

              ),
            ),
          ),
          Positioned(    //TODO
            child:  IconButton(

              onPressed: ()async{
                await userController.logOut();
              },
              icon: Icon(Icons.logout),
              iconSize:25.h,
              color: Colors.grey,
            ),
            top: 30.h,
            right: 5.w,
          ),
          // Icon arrow
          // Positioned(
          //   child: CircleAvatar(
          //     maxRadius: 22.h,
          //     backgroundColor: Colors.grey.shade500,
          //     child:  IconButton(
          //       onPressed: (){
          //         Get.back();
          //         oldPasswordController.clear();
          //         newPasswordController.clear();
          //         reconfirmPasswordController.clear();
          //
          //         oldPasswordNode.unfocus();
          //         newPasswordNode.unfocus();
          //         reconfirmPasswordNode.unfocus();
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
            node == oldPasswordNode ? newPasswordNode:node == newPasswordNode ? reconfirmPasswordNode : null,
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
          if(textEditingController == reconfirmPasswordController && reconfirmPasswordController.text != newPasswordController.text){
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
