import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/user%20controller.dart';
import 'package:project1/views/pages/sign%20up%20page.dart';

import '../buttons/my button.dart';
//import 'package:flutter_gif/flutter_gif.dart';
import 'package:percent_indicator/percent_indicator.dart';
class SwipePage extends StatefulWidget {
  SwipePage({super.key});

  @override
  State<SwipePage> createState() => _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  GlobalKey myKey = GlobalKey<FormState>();

  UserController userController = Get.find();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),

          Center(
            child:  SingleChildScrollView(
              child: Column(

                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 18.h ),
                    child: Container(
                  //  height: 300.h,


                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150).r,

                      ),
                      width: 120.w,


                      child: GetBuilder<UserController>(
                        builder: (_){
                          return   CircularPercentIndicator(
                            radius: 120.0.h,
                            lineWidth: 5.0.w,
                            percent: double.parse(userController.journeyInfo!.currentStage.toString())/userController.journeyInfo!.maxStagesNumber,
                            center:   Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100.h,
                                  //  width: 90.w,
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
                                      ]),
                                  child: Image.asset('assets/images/logo.png' , color: Colors.black,),
                                ),
                                Container(
                                  child: Image.asset('assets/images/logo_text.png' ,
                                    width: 200.w,
                                    height: 50.h,
                                    color: Colors.white,


                                  ),),
                                SizedBox(height: 5.h,),

                                //    Text("\$1,822" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold  ,fontSize: 22.sp),),
                                GetBuilder<UserController>(
                                  builder: (_){
                                    return Text(
                                        '\$ ${userController.userInfo.walletValue}',
                                        style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold  ,fontSize: 22.sp)
                                      //     overflow: TextOverflow.,
                                    );
                                  },
                                ),
                              ],

                            ),
                            progressColor: Colors.green,

                          );
                        },
                      ),

                    ),
                  ),
                  SizedBox(height: 10.h,),


                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.4), // Shadow color
                          offset: Offset(0, 7.h), // Horizontal, vertical offset
                          blurRadius: 6, // Spread or blur of the shadow
                          spreadRadius: 0,
                        ),
                      ]
                    ),
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),


                  GetBuilder<UserController>(
                    builder: (_){
                      return Container(
                          padding: EdgeInsets.only(top: 15.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10).r,
                                  border: Border.all(
                                      color: Colors.black38
                                  ),
                                  color: Colors.white10,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 45.w,
                                      height: 3.h,
                                      color: Colors.green,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10.h),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          Text('Current Stage', style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold  ,fontSize: 15.sp),),
                                          Text( userController.journeyInfo!.currentStage.toString(),style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold  ,fontSize: 15.sp),)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 20.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10).r,
                                  border: Border.all(
                                      color: Colors.black38
                                  ),
                                  color: Colors.white10,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 45.w,
                                      height: 3.h,
                                      color: Colors.yellowAccent,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10.h),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [


                                          Text('Today Rewards' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold  ,fontSize: 15.sp),),
                                          IconButton(
                                              onPressed: (){

                                                Clipboard.setData(ClipboardData(text: userController.journeyInfo!.todayRewards.toString())).then((value) {
                                                  Get.snackbar('Done', 'Today Rewards copied' , backgroundColor: Colors.indigo);
                                                });

                                              },
                                              icon: Icon(Icons.copy , color: Colors.white24,)),
                                          Text(userController.journeyInfo!.todayRewards.toString(),  style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold  ,fontSize: 15.sp)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),




                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10).r,
                                  border: Border.all(
                                      color: Colors.black38
                                  ),
                                  color: Colors.white10,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 45.w,
                                      height: 3.h,
                                      color: Colors.pinkAccent,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10.h),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Max Stage' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold  ,fontSize: 15.sp),),
                                          Text('Number'  ,style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold  ,fontSize: 15.sp),),
                                          Text(userController.journeyInfo!.maxStagesNumber.toString()  ,style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold  ,fontSize: 15.sp),)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                            ],
                          )
                      );
                    },
                  ),


                  Divider(
                    color: Colors.white,
                    thickness: 1/2,
                  ),



                  myContainer('Gardening' , 325.8),

                  myContainer('Baby Sitting' , 25.8),

                  myContainer('Home Cleaning' , 3295.8),




                GetBuilder<UserController>(
                    builder: (_){
                      return   GestureDetector(
                        onTap: ()async{
                          await userController.placeOrder();
                          userController.product!.success == true?
                          Get.toNamed('/taskPage'):
                          Get.snackbar('Error', userController.product!.message , snackPosition: SnackPosition.BOTTOM , backgroundColor: Colors.red , colorText: Colors.white);
                          ;
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(left: 20.w , right: 20.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20).r,
                            child: Image.asset("assets/images/Thumbtack-Logo.gif" ,scale: 1.h ,width: 300.w , height: 200.h,),
                          ),
                        ),
                      );
                    }
                ),



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
          //     //    Get.back();
          //         Get.toNamed('/frontPage');
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

          Positioned(
            child:  GetBuilder<UserController>(
              builder: (_){
                return userController.isLoading == true ? Container(child: CircularProgressIndicator()):
                Container();
              },
            ),

            top: 50.h,
            left:MediaQuery.of(context).size.width/2.w,
          ),

        ],
      ),

    );
  }
}

Container myContainer(String title ,  double number){
  return Container(
    margin: EdgeInsets.all(20.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20).r,
      border: Border.all(
          color: Colors.black54,
      ),
      color: Colors.white10,
    ),
    padding: EdgeInsets.all(15.w),
    child: Row(

      children: [
        Image.asset('assets/images/logo.png' , scale: 7.h,),
        SizedBox(width: 10.w,),
        Expanded(child: Text(title , style: TextStyle(color: Colors.white , fontSize: 20.sp),)),
        Expanded(
          child: Container(
              margin: EdgeInsets.only(left: 10.w),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  border: Border.all(
                      color: Colors.white
                  ),
                  color: Colors.white10,
                ),

                child: Center(child: Text('\$${number}' , style: TextStyle(color: Colors.white , fontSize: 20.sp),)),
              ),
        ),


      ],
    ),
  );
}


// child: Stack(
//   alignment: Alignment.center,
//   children: [
//     // Column(
//     //   mainAxisAlignment: MainAxisAlignment.center,
//     //   children: [
//     //     Container(
//     //       height: 100.h,
//     //     //  width: 90.w,
//     //       decoration: BoxDecoration(
//     //           borderRadius: BorderRadius.circular(130).r,
//     //           color: Colors.yellow[700],
//     //           boxShadow: [
//     //             BoxShadow(
//     //               color: Colors.yellow[700]!.withOpacity(0.9),
//     //               // Shadow color
//     //               spreadRadius: 1,
//     //               blurRadius: 10,
//     //               offset: Offset(
//     //                   0.w, 3.h), // S  offset: Offset(30,30),
//     //             ),
//     //           ]),
//     //       child: Image.asset('assets/images/logo.png'),
//     //     ),
//     //     Container(
//     //       child: Image.asset('assets/images/logo_text.png' ,
//     //         width: 200.w,
//     //         height: 50.h,
//     //         color: Colors.white,
//     //
//     //
//     //       ),),
//     //     SizedBox(height: 10.h,),
//     //
//     //     Text("\$1,822" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold  ,fontSize: 26.sp),)
//     //   ],
//     //
//     // ),
//     // CircularPercentIndicator(
//     //   // value: 0.70,
//     //   // color: Colors.green.shade400, //<-- SEE HERE
//     //   // backgroundColor: Colors.grey,
//     //   // strokeAlign: 34.w,
//     //   //
//     //   // strokeWidth: 6.h, //<-- SEE HERE
//     //   radius: 100.0.w,
//     //   lineWidth: 5.0.w,
//     //   percent: 0.70,
//     //   center:   Column(
//     //     mainAxisAlignment: MainAxisAlignment.center,
//     //     children: [
//     //       Container(
//     //         height: 100.h,
//     //         //  width: 90.w,
//     //         decoration: BoxDecoration(
//     //             borderRadius: BorderRadius.circular(130).r,
//     //             color: Colors.yellow[700],
//     //             boxShadow: [
//     //               BoxShadow(
//     //                 color: Colors.yellow[700]!.withOpacity(0.9),
//     //                 // Shadow color
//     //                 spreadRadius: 1,
//     //                 blurRadius: 10,
//     //                 offset: Offset(
//     //                     0.w, 3.h), // S  offset: Offset(30,30),
//     //               ),
//     //             ]),
//     //         child: Image.asset('assets/images/logo.png'),
//     //       ),
//     //       Container(
//     //         child: Image.asset('assets/images/logo_text.png' ,
//     //           width: 200.w,
//     //           height: 50.h,
//     //           color: Colors.white,
//     //
//     //
//     //         ),),
//     //       SizedBox(height: 10.h,),
//     //
//     //       Text("\$1,822" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold  ,fontSize: 26.sp),)
//     //     ],
//     //
//     //   ),
//     //   progressColor: Colors.green,
//     //
//     // ),
//   ],
// )