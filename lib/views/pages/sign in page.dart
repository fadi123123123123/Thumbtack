import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project1/views/pages/sign%20up%20page.dart';

import '../../controllers/sign in controller.dart';
import '../../controllers/sign up controller.dart';
import '../buttons/my button.dart';
FocusNode userNameNode = FocusNode();
FocusNode passwordNode = FocusNode();
SignInController logInController = Get.find();
class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  GlobalKey myKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/backgroundImage.png'),
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
            //     height: 300.h, // Adjust the height as needed
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter,
            //         colors: [
            //            Color(0xFF333333),
            //            Color.fromRGBO(70,71,70, 1),
            //             Color.fromRGBO(113,85,85, 1), // 107,81,80
            //             Color.fromRGBO(92,69,67, 1), // Top color
            //            Colors.transparent, // Transparent color at the bottom
            //         ],
            //
            //       ),
            //     ),
            //   ),
            // ),
            Center(
              child:  SingleChildScrollView(
            child: Column(

            children: [
            Container(
              height: 300.h,
              width: double.infinity,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                            height: 110.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              //  shape: BoxShape.circle,
                                color: Colors.white
                            ),),
                        Image.asset('assets/images/new_logo.png' ,width: 150.w,height: 150.h,)
                      ]
                  ),
                  Container(
                      child: Image.asset('assets/images/logo_text_white.png' ,
                        width: 270.w,
                        height: 50.h,
                        color: Colors.white,


                      ),),
                ],
              ),
            ),

            GetBuilder<SignInController>(
                builder: (_){
                  return logInController.isLoading == true ? CircularProgressIndicator() : Container();
                }
            ),


            Container(
              //  padding: EdgeInsets.all(20.h),

                padding: EdgeInsets.all(40.h),
                child: Form(
                  key: myKey,
                  child: Column(
                    children: [
                      MyTextFormField(textEditingController: userNameController, lebelText: "user name" , icon: Icons.person_2_outlined,node: userNameNode,),
                      SizedBox(height: 10.h,),
                      MyTextFormField(textEditingController: passwordController, lebelText: "password" , icon: Icons.lock_outline, node: passwordNode,),
                    ],
                  ),
                )
            ),



            MyButton.myCustomButton("Log in", (){
              FocusScope.of(context).unfocus();
              logInController.check(myKey ,userNameController.text, passwordController.text);

            }),
            SizedBox(height: 30.h,),

            Text(''' By clicking Log In, you agree to our Terms. Learn
   how we process your data in our Privacy Policy
                                    and Cookie Policy.''',
              style: TextStyle(color: Colors.white54),),
              SizedBox(height: 15.h,),




          ],

        ),
    ),
            ),
               // Icon arrow
            Positioned(
              child: CircleAvatar(
                maxRadius: 22.h,
                backgroundColor: Colors.grey.shade500,
                child:  IconButton(
                  onPressed: (){
                    userNameController.clear();
                    passwordController.clear();
                    userNameNode.unfocus();
                    passwordNode.unfocus();
                    Get.offNamed('/signUpPage');
                 //   Get.back();
                  },
                     icon: Icon(Icons.arrow_back_ios_new_outlined),
                        iconSize:25.h,
                        color: Colors.black,
                         ),


              ),
              top: 30.h,
              left: 5.w,
            ),

            Positioned(
              child:  Image.asset('assets/images/leftSide.png' , width: 40.w, height: 100.h),

              top: 230.h,
              left: 0.w,
            ),

            Positioned(
              child:  Image.asset('assets/images/rightSide.png' , width: 40.w, height: 100.h,),

              top: 290.h,
              right: 0.w,
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
    //    color: Colors.white,
      ),
      child:

      GetBuilder<SignInController>(
        builder: (_){
          return  TextFormField(
            focusNode:widget.node ,
            onFieldSubmitted: (value){
              FocusScope.of(context).requestFocus(
                widget.node == userNameNode? passwordNode :null,
              );
            },
            style: TextStyle(color: Colors.white),
            obscureText: widget.node == passwordNode && isShowPassword == true?true : false,
            controller: widget.textEditingController,
            decoration: InputDecoration(
              prefixIcon: Icon(widget.icon , size: 36,color: Colors.grey,),
              labelText: widget.lebelText,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              suffixIcon: widget.node== passwordNode?
              IconButton(
                icon: Icon(isShowPassword==false?Icons.remove_red_eye_outlined:Icons.remove_red_eye) ,
                onPressed: (){
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                color: Colors.grey,
              ):null,

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
          //  autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value)
            {
              // if (value!.isEmpty || value.trim().isEmpty) {
              //   return '${lebelText} is required';
              // }

              if(logInController.errorMessage != "" )
                {
                 // return logInController.errorMessage;
                  return '';
                }


              return null;
            },

          );
        },
      ),
    );

  }
}
