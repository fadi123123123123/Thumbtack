import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/password%20settings%20controller.dart';
import 'package:project1/controllers/user%20controller.dart';
import 'package:project1/views/pages/sign%20up%20page.dart';

import 'package:get/get.dart';

import '../../controllers/sign up controller.dart';
import '../buttons/my button.dart';
class WalletSavingPage extends StatefulWidget {
  WalletSavingPage({super.key});

  @override
  State<WalletSavingPage> createState() => _WalletSavingPageState();
}

class _WalletSavingPageState extends State<WalletSavingPage> {
  GlobalKey myKey = GlobalKey<FormState>();
  UserController userController = Get.find();

  PasswordSettingsController passwordSettingsController = Get.find();

  @override
  void initState() {
    walletController.clear();
    print(userController.userInfo.withdrawalPin);
    super.initState();
  }



  TextEditingController walletController = TextEditingController();


  void handleRadioValueChanged(String value) {
    setState(() {
      selectedOption = value;
    });
  }

  String selectedOption = "TRC20";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black,
     resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),

          Center(
            child:  SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  SizedBox(height: 20.h,),







                  Padding(
                    padding:  EdgeInsets.all(8.0.w),
                    child: Image.asset('assets/images/logo_text_white.png' , color: Colors.white,),
                  ),

                  SizedBox(
                    height: 14.h,
                  ),

                GetBuilder<PasswordSettingsController>(
                    builder: (_){
                      return passwordSettingsController.isLoading == true? CircularProgressIndicator():Container();
                    }
                ),


                  GetBuilder<UserController>(
                      builder: (_){
                        return Text( userController.userInfo.walletAddress == 'null' ?   'you\`re one step closer to get paid' : 'Last step to get your Salary!' , style: TextStyle(color: Colors.white , fontSize: 15.sp),);
                      }
                  ),

                  SizedBox(
                    height: 14.h,
                  ),




                 GetBuilder<UserController>(
                   builder: (_){
                     return Container(
                       child: Stack(
                         alignment: Alignment.center,
                         children: [

                           Transform.translate(
                             offset: Offset(30.w,0),
                             child: Transform.rotate(
                               angle: 0.2,
                               child: Container(

                                 width: 210.w,
                                 height: 300.h,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20).r,
                                   color: Color.fromRGBO(41,41,51, 1),
                                 ),

                               ),
                             ),

                           ),


                           Transform.translate(
                             offset: Offset(20.w,0),
                             child: Transform.rotate(
                               angle: 0.1,
                               child: Container(
                                 width: 210.w,
                                 height: 320.h,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20).r,
                                   color: Color.fromRGBO(72,72,89, 1),
                                 ),
                               ),
                             ),
                           ),

                           Container(
                             width: 230.w,
                             height: 380.h,
                             padding: EdgeInsets.all(10.w),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20).r,
                               color: Color.fromRGBO(26,28,40, 1),
                             ),
                             child: Stack(
                               children: [
                                 SingleChildScrollView(
                                   child: Column(
                                     children: [



                                       Image.asset('assets/images/wallet_saving_logo.png',width: 70.w,),
                                       Text("USDT" , style: TextStyle(color: Colors.white , fontSize: 15.sp),),

                                       SizedBox(height: 20.h,),
                                       // userController.userInfo.walletAddress != 'null' ? Text('Wallet Value : \$ ${userController.userInfo.walletValue.toString()}' , style: TextStyle(color: Colors.white )):Container(),
                                       // SizedBox(height: 10.h,),
                                       // userController.userInfo.walletAddress != 'null' ?
                                       // Text('\Wallet Address : ${userController.userInfo.walletAddress.toString()}' , style: TextStyle(color: Colors.white )):Container(),
                                       // SizedBox(height: 10.h,),
                                       // Text(userController.userInfo.username , style: TextStyle(color: Colors.white , fontSize: 20.sp),),
                                       // SizedBox(height: 20.h,),

                                   buildContainer(),
                                       SizedBox(height: 20.h,),

                                       Form(
                                         key: myKey,
                                         child:  MyTextFormField(lebelText: userController.userInfo.walletAddress == 'null'?  'Fill up your wallet address' : 'Fill up your withdrawal pin', textEditingController: walletController),
                                       ),

                                       userController.userInfo.walletAddress == 'null' ?
                                       Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Radio(
                                             activeColor: Colors.white,
                                             value: "TRC20",
                                             groupValue: selectedOption,
                                             onChanged: (val){
                                               setState(() {
                                                 selectedOption = val!;
                                               });
                                             },
                                           ),

                                           Text("TRC20" , style: TextStyle(color: Colors.white , fontSize: 8.sp),),

                                           Radio(
                                             activeColor: Colors.white,
                                             value: "ERC20",
                                             groupValue: selectedOption,
                                             onChanged: (val){
                                               setState(() {
                                                 selectedOption = val!;
                                               });
                                             },
                                           ),
                                           Text("ERC20" , style: TextStyle(color: Colors.white , fontSize: 8.sp),),


                                           Radio(
                                             activeColor: Colors.white,
                                             value: "ETH",
                                             groupValue: selectedOption,
                                             onChanged: (val){
                                               setState(() {
                                                 selectedOption = val!;
                                               });
                                             },
                                           ),
                                           Text("ETH" , style: TextStyle(color: Colors.white , fontSize: 8.sp),),
                                         ],
                                       ):
                                       Container(),

                                       SizedBox(height: 20.h,),



                                       myCustomButton(userController.userInfo.walletAddress == 'null' ? "Save" : "Withdraw", ()async{

                                         if(userController.userInfo.walletAddress == 'null') {
                                           await passwordSettingsController.checkSaveWalletAddress(myKey, walletController.text, selectedOption).then((value) => walletController.clear()).then((value) {
                                             FocusScope.of(context).unfocus();
                                           });
                                         }
                                         else{
                                           await  passwordSettingsController.checkWithdraw(myKey, walletController.text).then((value) => walletController.clear()).then((value) {
                                             FocusScope.of(context).unfocus();
                                           });

                                         }















                                       }),






                                     ],

                                   ),
                                 ),

                                 Positioned(
                                      right: 0.w, bottom: 0.h       ,
                                     child: Image.asset('assets/images/img22.png' , scale: 1.4.h,)
                                 ),

                                 Positioned(
                                     left: 0.w, top: 5.h,
                                     child: Transform.rotate(
                                           angle:45*pi ,
                                         child: Image.asset('assets/images/img22.png' , scale: 1.3.h, )
                                     )
                                 ),
                               ],
                             )
                           ),
                         ],
                       ),
                     );
                   },
                 ),








                  SizedBox(height: 15.h,),


                  // SizedBox(height: 10.h,),
                  Padding(
                    padding:  EdgeInsets.only(left: 30.w , right: 30.w , bottom: 20.h),
                    child: Text('Why Thumbtack is using USDT?Now you are assigning jobs to the Thumbtack Pro from all around the world USDT is the only fastest and stable way to pay overseas!' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold ,fontSize: 12.sp),),
                  )





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
          //         walletController.clear();
          //
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

  Container buildContainer() {
    return Container(
                                  // height: 100.h,
                                   width: double.infinity,
                                   padding:  EdgeInsets.only(left: 4.w , right: 3.w , bottom: 4.h),
                                   decoration: BoxDecoration(
                                       gradient: const LinearGradient(
                                         begin: Alignment.topLeft,
                                         end: Alignment.bottomRight,
                                         colors: [
                                           // Color(0xFF846AFF),
                                           // Color(0xFF755EE8),
                                           // Colors.purpleAccent,
                                           // Colors.amber,
                                           Color.fromRGBO(26,28,40, 1),

                                           Color.fromRGBO(72,72,89, 1),
                                           Color.fromRGBO(41,41,51, 1),

                                         ],
                                       ),
                                       borderRadius: BorderRadius.circular(16.r)), // Adds a gradient background and rounded corners to the container
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                        Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                               children: [
                                           //      Text('Family Card', style: TextStyle(  color: Colors.white,),), // Adds a title to the card
                                                 Flexible(child: Text(userController.userInfo.username , style: TextStyle(color: Colors.white , fontSize: 12.sp , fontWeight: FontWeight.bold),)),
                                                 SizedBox(height: 10.h,),
                                                 SizedBox(height: 10.h,),
                                                  Spacer(),
                                                 Stack(
                                                   children: List.generate(
                                                     2,
                                                         (index) => Container(
                                                       margin: EdgeInsets.only(left: (15.w * index).toDouble()),
                                                       height: 30.h,
                                                       width: 30.w,
                                                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r), color: Colors.white54),
                                                     ),
                                                   ),
                                                 ) // Adds a stack of two circular containers to the right of the title
                                               ],
                                             ),
                                             userController.userInfo.walletAddress != 'null' ?
                                             Text('\Wallet Address : ${userController.userInfo.walletAddress.toString()}' , style: TextStyle(color: Colors.white )):Container(),
                                           ],
                                         ),
                                       SizedBox(height: 30.h,),
                                       userController.userInfo.walletAddress != 'null' ? Text('Wallet Value : \$ ${userController.userInfo.walletValue.toString()}' , style: TextStyle(color: Colors.white )):Container(),// Adds a price to the bottom of the card
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
  UserController userController = Get.find();
  MyTextFormField({@required this.textEditingController , @required this.lebelText , @required this.icon , @required this.node});
  SignUpController signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0.r),
        //color: Colors.white,
      ),

      child: TextFormField(
 //       initialValue: 'This is a read-only field.',
        obscureText: lebelText == "password"?true : false,
        controller: textEditingController,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          //   prefixIcon: Icon(icon , size: 36,),
          labelText:lebelText,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          hintStyle: TextStyle(
              color: Colors.white
          ),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20.0.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20.0.r),
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
            return 'this field is required';
          }
          return null;
        },
        onSaved: (value){
          // String s= signUpController.strigTrim(value!);
          // print(s);
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
        width: 150.w,
        child: Center(child: Text(text , style: TextStyle(color: Colors.white , fontSize: 17.sp),)),
        decoration: BoxDecoration(
          //       color: Colors.black,
          borderRadius: BorderRadius.circular(20).r,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(26,28,40, 1),
              Color.fromRGBO(70,70,86, 1),
             // Color.fromRGBO(113,85,85, 1), // 107,81,80
              //Color.fromRGBO(92,69,67, 1),
              // Top color
              Color.fromRGBO(42,42,52, 1),
          //    Colors.blueGrey,
              //Colors.transparent, // Transpar// Transparent color at the bottom
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
