import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/user controller.dart';
import 'package:get/get.dart';


class ReturnToFrontPage extends StatefulWidget {
  const ReturnToFrontPage({super.key});

  @override
  State<ReturnToFrontPage> createState() => _ReturnToFrontPageState();
}

class _ReturnToFrontPageState extends State<ReturnToFrontPage> {
  UserController userController = Get.find();
  @override
  void initState() {
    userController.getjourney();
    super.initState();
  }

  List<Widget> myList = [

    Container(
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/img1.png' , width: 130.w,height: 150.h,),
              Image.asset('assets/images/img2.png' , width: 130.w,height: 150.h,),

            ],
          ),
    ),

    Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/img4.png' , width: 130.w,height: 150.h,),
          Image.asset('assets/images/img5.png' , width: 130.w,height: 150.h,),
    //      Image.asset('assets/images/img6.png'),
        ],
      ),
    ),

    Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/img7.png' , width: 130.w,height: 150.h,),
          Image.asset('assets/images/img8.png' , width: 130.w,height: 150.h,),
          //      Image.asset('assets/images/img6.png'),
        ],
      ),
    ),

    Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/img9.png' , width: 130.w,height: 150.h,),
          Image.asset('assets/images/img10.png' , width: 130.w,height: 150.h,),
          //      Image.asset('assets/images/img6.png'),
        ],
      ),
    ),

    Container(
      child:
          Image.asset('assets/images/img11.png' ),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed('/homePage');
                },
                child: Container(
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
              ),
              SizedBox(
                height: 25.h,
              ),
              Image.asset(
                'assets/images/logo_text.png',
                color: Colors.white,
                width: 300.w,
                height: 45.h,
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                width: 200.0.w,
                //   height: 50.0,
                padding: EdgeInsets.all(10).h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20).r,
                  color: Colors.black, // Adjust the shade as needed
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white, // Shadow color
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 0), // Shadow offset
                    ),
                  ],
                ),
                child: Center(
                  child:  GetBuilder<UserController>(
                    builder: (_){
                      return Text(
                        '\$ ${userController.userInfo.walletValue}',
                        style: TextStyle(
                            color: Colors.white, fontSize: 20.sp),
                        //     overflow: TextOverflow.,
                      );
                    },
                  ),

                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Divider(
                color: Color.fromRGBO(96,96,96, 1),
                thickness: 4.h,
                endIndent: 5,
               indent: 3,
              ),

              // Padding(
              //   padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width/9.w ,),
              //   child: Image.asset('assets/images/three_stars.png' ,height: 50.h, ),
              // ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/p7.png' , width: 35.w,),
                        Image.asset('assets/images/p5.png' , width: 35.w),
                        Image.asset('assets/images/p8.png' , width: 35.w),
                      ],
                    ),
                  ),
                  Text('it\'s that' , style: TextStyle(color: Colors.white , fontSize: 40.sp , fontWeight: FontWeight.bold),),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(left: 15.w),
                child: Text('time again.', style: TextStyle(color: Colors.white , fontSize: 40.sp , fontWeight: FontWeight.bold),),
              ),


              Text('A  N E W   P R O   R E W A R D S   P E R I O D  I S   H E R E.' , style: TextStyle(color: Colors.blue , fontWeight: FontWeight.bold , fontSize:10.sp),),
                  
              //
              SizedBox(
                height: 10.h,
              ),
              // Divider(
              //   color: Colors.white24,
              //   thickness: 4.h,
              //
              // ),
              Image.asset('assets/images/line3.png' ),

              // CustomPaint(
              //   size: Size(400.w, 20.h), // Adjust the size of your curved line
              //   painter: CurvedBottomLinePainter(),
              // ),


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
                items: myList.map((element) {
                  return element;
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}


