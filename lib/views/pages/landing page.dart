import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/user%20controller.dart';
import 'package:project1/views/buttons/my%20button.dart';
import 'package:carousel_slider/carousel_slider.dart';
class LandingPage extends StatefulWidget {
   LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  UserController userController = Get.find();
  @override
  void initState() {
    userController.getjourney();
    super.initState();
  }

  List<Widget> myList = [
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Thumbtack is a place that I would recommend real people to go.If you need to have your sink done, replaced, go to Thumbtack.'),

          Text('-Lawrence',style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    ),

    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('I didn\'t realize how many professionals Thumbtack had on it. You type in things like house cleaning, you get a ton of pros. You name it. It\'s there.'),

          Text('-Terrence',style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    ),

    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('We found so many people on Thumbtack. And some of the people we found on Thumbtack, like our electrician, we use him now. He\'s great.'),

          Text('-Pamela',style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/landing_background.png'),
              fit: BoxFit.cover),
        ),
        child:  SafeArea(
          child: Padding(
            padding:  EdgeInsets.only(left: 36.w , right: 36.w , top: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Expanded(
                      child: ListView(
                        shrinkWrap: true,
                    children: [
                      Row(
                        children: [
                          Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    //  shape: BoxShape.circle,
                                      color: Colors.white
                                  ),),
                                Image.asset('assets/images/new_logo.png' ,width: 50.w,height: 50.h,)
                              ]
                          ),
                          Image.asset('assets/images/logo_text.png' ,width: 220.w,height: 100.h,color: Colors.white,),
                        ],
                      ),

                      ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(150).r , topRight: Radius.circular(150).r),
                        child:Image.asset('assets/images/landing1.png' ,width: 300.w,height: 300.h,),
                      ),

                      SizedBox(height: 55.h,),

                      Center(
                        //padding:  EdgeInsets.only(left: 30.w),
                        child: Text('These reviews say it' , style: TextStyle(fontSize: 25.sp , fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 25.h,),


                      CarouselSlider(
                          options: CarouselOptions(
                            height: 140.h,
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
                          //  onPageChanged: callbackFunction,
                            scrollDirection: Axis.vertical,
                          ),
                        items: myList.map((i) {
                          return i;
                        }).toList(),
                      )

                   //   SizedBox(height: 70.h,),
                    ],
                  )),

                //    SizedBox(height: 70.h,),



                    MyButton.myCustomButton("Confirm", (){
                      Get.offAllNamed('/frontPage');
                    }),
                  ],
                ),

          ),
        ),

      ),
    );
  }
}
