import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/sign%20up%20controller.dart';

import '../buttons/my button.dart';


FocusNode userNameNode = FocusNode();
FocusNode passwordNode = FocusNode();
FocusNode phoneNode = FocusNode();
FocusNode referrallCodeNode = FocusNode();
FocusNode emailNode = FocusNode();
FocusNode confirmPasswordNode = FocusNode();


TextEditingController userNameController = TextEditingController();

TextEditingController passwordNameController = TextEditingController();

TextEditingController phoneController = TextEditingController();

TextEditingController referralCodeController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
class SignUpPage extends StatefulWidget {
   SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   SignUpController signUpController = Get.find();

   GlobalKey myKey = GlobalKey<FormState>();


   @override

  @override
  Widget build(BuildContext context) {
//backgroundImage.png
    return  Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_signup.png'),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            // Container(
            //   color: Colors.black,
            // ),
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     height: 300, // Adjust the height as needed
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter,
            //         colors: [
            //           Color.fromRGBO(113,85,85, 1), // 107,81,80
            //           Color.fromRGBO(92,69,67, 1),
            //           Color(0xFF333333),
            //       Color.fromRGBO(70,71,70, 1),
            //       // Top color
            //       Colors.transparent,
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
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
                          Stack(
                            alignment: Alignment.center,
                              children: [
                                Container(height: 110.h,width: 70.w,color: Colors.white,),
                                     Image.asset('assets/images/new_logo.png' ,width: 150.w,height: 150.h,)
                      ]),
                          Container(
                            child: Image.asset('assets/images/logo_text_white.png' ,
                              width: 270.w,
                              height: 50.h,
                              color: Colors.white,


                            ),),
                        ],
                      ),
                    ),

                    GetBuilder<SignUpController>(
                        builder: (_){
                          return signUpController.isLoading == true ? CircularProgressIndicator() : Container();
                        }
                    ),



                    Container(
                        padding: EdgeInsets.all(40.h),
                        child: Form(
                          key: myKey,
                          child: Column(
                            children: [
                              Text("Welcome!" , style: TextStyle(color: Colors.white , fontSize: 25.sp , fontWeight: FontWeight.bold),),
                              MyTextFormField(textEditingController: userNameController, lebelText: "user name" , icon: Icons.person_2_outlined,node: userNameNode,),
                              MyTextFormField(textEditingController: emailController, lebelText: "email" , icon: Icons.email_outlined, node: emailNode,),
                              MyTextFormField(textEditingController: phoneController, lebelText: "phone number" , icon: Icons.phone_outlined,node: phoneNode,),
                              MyTextFormField(textEditingController: referralCodeController, lebelText: " Referral Code" , icon: Icons.people_outline, node: referrallCodeNode,),

                              MyTextFormField(textEditingController: passwordNameController, lebelText: "password" , icon: Icons.lock_outline, node: passwordNode,),

                              MyTextFormField(textEditingController: confirmPasswordController, lebelText: "confirm password" , icon: Icons.confirmation_num_outlined, node:confirmPasswordNode,),
                            ],
                          ),
                        )
                    ),


                    // SizedBox(height: 10.h,),
                    MyButton.myCustomButton("Sign Up", (){
                      FocusScope.of(context).unfocus();
                      signUpController.check(myKey ,userNameController.text , emailController.text, passwordNameController.text , referralCodeController.text , phoneController.text , confirmPasswordController.text);

                    }),
                    SizedBox(height: 8.h,),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("you don't have an account? ", style: TextStyle(color: Colors.white),),
                        GestureDetector(
                          onTap: (){
                            Get.offNamed('/signInPage');

                              userNameController.clear();
                              passwordNameController.clear();
                              phoneController.clear();
                              emailController.clear();
                              referralCodeController.clear();
                              confirmPasswordController.clear();
                              confirmPasswordNode.unfocus();
                              userNameNode.unfocus();
                              passwordNode.unfocus();
                              emailNode.unfocus();
                              phoneNode.unfocus();
                              referrallCodeNode.unfocus();

                          },
                          child: Text("Log in" , style: TextStyle(color: Colors.red , fontSize: 20.sp),),
                        ),
                      ],
                    ),

                  ],

                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
class MyTextFormField extends StatefulWidget {
  var textEditingController;


  String? lebelText;
  IconData? icon;
  FocusNode? node;
  MyTextFormField({@required this.textEditingController , @required this.lebelText , @required this.icon , @required this.node});

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  SignUpController signUpController = Get.find();

 bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
       // color: Colors.white,
      ),
      child: TextFormField(
        focusNode:widget.node ,
        onFieldSubmitted: (value){
          print(widget.node);
          FocusScope.of(context).requestFocus(
            widget.node == userNameNode? emailNode : widget.node  == emailNode ? phoneNode : widget.node == phoneNode ? referrallCodeNode : widget.node == referrallCodeNode ? passwordNode:  widget.node == passwordNode ?confirmPasswordNode :null,
          );
        },
        style: TextStyle(color: Colors.white),
        keyboardType:widget.node== phoneNode ? TextInputType.phone: TextInputType.emailAddress,
        obscureText: widget.node == passwordNode && isShowPassword==true || widget.node == confirmPasswordNode && isShowPassword==true?  true:false,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon , size: 36,color: Colors.grey,),
          suffixIcon: widget.node== passwordNode || widget.node == confirmPasswordNode?
          IconButton(
            icon: Icon(isShowPassword==false?Icons.remove_red_eye_outlined:Icons.remove_red_eye) ,
            onPressed: (){
              setState(() {
                print(widget.node );
                print(isShowPassword);
                isShowPassword = !isShowPassword;
              });
            },
            color: Colors.grey,
          ):null,
          labelText: widget.lebelText,
          labelStyle: TextStyle(
            color: Colors.white,
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
        validator: (value)
        {
          // if ( passwordNameController.text != confirmPasswordController.text &&  textEditingController ==confirmPasswordController ) {
          //   return 'Password does not match';
          // }

          if(signUpController.errorMessage != "" )
          {
           // return signUpController.errorMessage;
            return '';
          }

     //     return null;
        },

      ),
    );

  }
}