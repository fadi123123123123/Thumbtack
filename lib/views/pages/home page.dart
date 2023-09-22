import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project1/models/journey%20info.dart';
import 'package:project1/models/user%20info.dart';

import '../../controllers/user controller.dart';
import '../../services/settings services.dart';


class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserController userController = Get.find();
  SettingsServices settingsServices = Get.find();
  List<Widget> myList = [
    Image.asset('assets/images/wisetack_logo.png' , scale:2.w,),
    Image.asset('assets/images/workiz_logo.png' , scale:4.w,),
    Image.asset('assets/images/heb_logo.png' , scale:2.5.w,),
    Image.asset('assets/images/hatchLogo.png' , scale:5.5.w,),
  ];

  List<Widget> myList1 = [
    Image.asset('assets/images/icon2.png' ,scale: 1.w,),
    Image.asset('assets/images/icon3.png' ,scale: 1.w,),
    Image.asset('assets/images/icon4.png' ,scale: 1.w,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [


           FutureBuilder(
               future: userController.getjourney(),
               builder: (_,snapShot){
                 if(snapShot.hasData) {
                   JourneyInfo journeyInfo = snapShot.data;
                   return  SingleChildScrollView(
                     child: Center(
                       child: Container(
                         padding: EdgeInsets.only(top: 100.h),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [

                             // Center(
                             //   child: ListTile(
                             //     leading: Icon(Icons.add , color: Colors.white,),
                             //     title: Text('user name' , ),
                             //     subtitle: Text(journeyInfo.username , style: TextStyle( color: Colors.white,fontSize: 14.sp , fontWeight: FontWeight.bold)),
                             //     titleTextStyle:  TextStyle( color: Colors.white,fontSize: 17.sp , fontWeight: FontWeight.bold),
                             //
                             //   ),
                             // ),
                             //
                             //
                             // Text('user name : ${journeyInfo.username}', style: TextStyle( color: Colors.white,fontSize: 17.sp , fontWeight: FontWeight.bold)),
                             // Text('- - - - - - - - - - - - - - - - - -',style: TextStyle( color: Colors.white,fontSize: 20.sp)),
                             //
                             //
                             // Text("current stage : ${journeyInfo.currentStage}", style: TextStyle( color: Colors.white,fontSize: 17.sp , fontWeight: FontWeight.bold)),
                             // Text('- - - - - - - - - - - - - - - - - -',style: TextStyle( color: Colors.white,fontSize: 20.sp)),
                             //
                             // Text('max stages number : ${journeyInfo.maxStagesNumber }', style: TextStyle( color: Colors.white,fontSize: 17.sp , fontWeight: FontWeight.bold)),
                             // Text('- - - - - - - - - - - - - - - - - -',style: TextStyle( color: Colors.white,fontSize: 20.sp)),


                             Stack(
                               alignment: Alignment.bottomCenter,
                               children:[
                                 CarouselSlider(
                                 options: CarouselOptions(
                                   height: 150.h,
                                   aspectRatio: 16/9,
                                   viewportFraction: 0.8,
                                   initialPage: 0,
                                   enableInfiniteScroll: true,
                                   reverse: false,
                                   autoPlay: true,
                                   autoPlayInterval: Duration(seconds: 3),
                                   autoPlayAnimationDuration: Duration(milliseconds: 800),
                                   autoPlayCurve: Curves.fastOutSlowIn,
                                   enlargeCenterPage: true,
                                   enlargeFactor: 0.3,
                                   // onPageChanged: callbackFunction,
                                   scrollDirection: Axis.horizontal,
                                 ),
                                 items: myList1.map((element) {
                                   return element;
                                 }).toList(),
                               ),
                                 Container(
                                   //   margin: EdgeInsets.only(left:50.w ),
                                   height: 40.h,
                                   width: 60.w,
                                   decoration: BoxDecoration(
                                       color: Colors.red.shade900,
                                       borderRadius: BorderRadius.circular(30).r
                                   ),
                                   child: Center(child: Text('PRO' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20.sp),)),
                                 ),
                       ],
                             ),



                             SizedBox(height: 15.h,),


                             SizedBox(height: 10.h,),

                             Divider(
                               color: Colors.green,
                               thickness: 4,
                             ),

                             SizedBox(height: 10.h,),

                             FutureBuilder(
                                 future: userController.getUserInfo(),
                                 builder: (_ , snapShot){
                                   if(snapShot.hasData){
                                     UserInfo userInfo = snapShot.data;
                                     return Column(
                                       children: [
                                         buildContainerAccountBalance('\$ ${userInfo.walletValue.toString()}', "Account Balance" , Colors.blueAccent),

                                         SizedBox(height: 25.h,),

                                         buildContainerEmployeeId(userInfo.adminCode),
                                         SizedBox(height: 25.h,),

                                         buildContainerAccountBalance(userInfo.accountLevel , "Current level" , Colors.red),
                                       ],
                                     );

                                   }else if(snapShot.connectionState == ConnectionState.waiting){
                                     return Center(child: CircularProgressIndicator());
                                   }
                                   return Center(child: Text("Check internet connection" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),);
                                 }
                             ),




                             SizedBox(height: 15.h,),
                             CarouselSlider(
                               options: CarouselOptions(
                                 height: 100.h,
                                 aspectRatio: 16/9,
                                 viewportFraction: 0.8,
                                 initialPage: 0,
                                 enableInfiniteScroll: true,
                                 reverse: false,
                                 autoPlay: true,
                                 autoPlayInterval: Duration(seconds: 3),
                                 autoPlayAnimationDuration: Duration(milliseconds: 10),
                                 autoPlayCurve: Curves.linear,
                                 enlargeCenterPage: true,
                                 enlargeFactor: 0.3,
                                 // onPageChanged: callbackFunction,
                                 scrollDirection: Axis.horizontal,
                               ),
                               items: myList.map((element) {
                                 return element;
                               }).toList(),
                             ),









                           ],
                         ),
                       ),
                     ),
                   );
                 }
                 else if(snapShot.connectionState == ConnectionState.waiting)
                   return Center(child: CircularProgressIndicator());
                 return Center(child: Text("Check internet connection" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),);
               }
           ),




            Positioned(
              child: CircleAvatar(
                maxRadius: 22.h,
                backgroundColor: Colors.grey.shade500,
                child:  IconButton(
                  onPressed: (){
                    Get.back();
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
              child: Image.asset('assets/images/p7.png' ,scale: 1.2.h,),
              top: 30.h,
              right: (MediaQuery.of(context).size.width)/2,
            ),

            Positioned(
              child: Image.asset('assets/images/p5.png' ,scale: 1.6.h,),
              top: 300.h,
              left:-10.w,
            ),

            Positioned(
              child: Image.asset('assets/images/p8.png' ,scale: 1.6.h,),
              top: 440.h,
              right: 0.w,
            ),

          ],
        ),
      ),
    );
  }

  Text buildText(String title , String text) => Text('${title} : ${text}', style: TextStyle( color: Colors.white,fontSize: 17.sp));

  Container buildContainerEmployeeId(String text) {
    return Container(//    height: 50,
                    margin: EdgeInsets.only(left: 60.w,right: 60.w),
                    padding: EdgeInsets.only(left: 12.w,right: 15.w , top: 2.h),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30).r,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.pinkAccent,
                            offset: Offset(0,2.h),
                            blurRadius: 10

                        ),
                      ],
                      border: Border.all(
                          color: Colors.white,
                          width: 3.w
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Expanded(child: Text(text,style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20.sp),)),
                            IconButton(
                                onPressed: (){
                              Clipboard.setData(ClipboardData(text: userController.userInfo.id)).then((value) {
                                Get.snackbar('Done', 'ID copied' , backgroundColor: Colors.indigo,);
                              });
                            },
                                icon: Icon(Icons.copy , color: Colors.white,size: 30.h,)

                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Employee ID",style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  );
  }

  Container buildContainerAccountBalance(String number , String title , Color color) {
    return Container(//   height: 50,
                    margin: EdgeInsets.only(left: 60.w,right: 60.w),
                    padding: EdgeInsets.only(left: 12.w,right: 15.w , top: 2.h),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    borderRadius: BorderRadius.circular(30).r,
                    boxShadow: [
                      BoxShadow(
                        color: color,
                        offset: Offset(0,2.h),
                        blurRadius: 10

                      ),
                    ],
                    border: Border.all(
                      color: Colors.white,
                      width: 3.w
                    ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(child: Text('''${number}''',style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20.sp),))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(title,style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  );
  }
}
