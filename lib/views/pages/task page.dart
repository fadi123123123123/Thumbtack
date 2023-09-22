import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project1/views/buttons/my%20button.dart';

import '../../controllers/user controller.dart';

class TaskPage extends StatefulWidget {
  TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>  with TickerProviderStateMixin {
  UserController userController = Get.find();

  List<Widget> myList = [
    Image.asset('assets/images/wisetack_logo.png' , scale:2.w,),
    Image.asset('assets/images/workiz_logo.png' , scale:4.w,),
    Image.asset('assets/images/heb_logo.png' , scale:2.w,),
    Image.asset('assets/images/hatchLogo.png' , scale:5.w,),
  ];

  Animation<double>? animation;
  AnimationController? controller;
  @override
  void initState() {
 //   print(userController.product!.productimgUrl.toString());
    controller =
    new AnimationController(vsync: this, duration: Duration(seconds: 5))
      ..repeat(reverse: true , min: 0.3 );
    animation = new CurvedAnimation(parent: controller!, curve: Curves.easeInOutBack);
    super.initState();
  }
  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  //  print(userController.userInfo.id);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 80.h, left: 15.w, right: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ListView(
                      shrinkWrap: true,
                      children: [
                        Image.asset(
                          'assets/images/logo_text.png',
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(150).r,
                              topRight: Radius.circular(150).r),
                          child:CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: 'https://thumbtack.life/public${userController.product!.productimageUrl.toString()}',
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.error , color: Colors.red,),
                                Text('An error occurred while loading the image. Try again later' , style: TextStyle(color: Colors.white , fontSize: 10.sp),)
                              ],

                            ),
                          ),
                          //TODO
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Center(
                          //padding:  EdgeInsets.only(left: 30.w),
                          child: ScaleTransition(
                            scale: animation!,
                            child: Text(
                              'We found you a job',
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),


                        buildContainer(),

                        SizedBox(
                          height: 15.h,
                        ),

                        buildContainer2(),
                        SizedBox(
                          height: 15.h,
                        ),



                        MyButton.myCustomButton("Assign", () async{
                         // Get.toNamed('/missionSuccessPage');
                     bool success =  await  userController.submitOrder();
                     success == true ? Get.toNamed('/missionSuccessPage') : Get.toNamed('/missionUnSuccessPage');




                        //  Get.toNamed('/missionUnSuccessPage');
                        }),



                        SizedBox(
                          height: 5.h,
                        ),


                     //   Image.asset('assets/images/hatchLogo.png' , scale: 2,)
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
                    )),

                  ],
                ),
              ),
            ),
            Positioned(
              child: CircleAvatar(
                maxRadius: 22.h,
                backgroundColor: Colors.grey.shade500,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                  iconSize: 25.h,
                  color: Colors.black,
                ),
              ),
              top: 30.h,
              left: 5.w,
            ),

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
        ));
  }

  Container buildContainer2() {
    return Container(
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10).r,
                            color: Colors.grey.shade900),
                        child: IntrinsicHeight( // TODO
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                                  Text(
                                    'Commission',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp),
                                  ),


                              VerticalDivider(
                                color: Colors.white,
                                thickness: 2.w,
                                //width: 13,
                                endIndent: 1.h,
                                indent: 1.h,
                              ),

                                  Text(
                                    '\$ ${userController.product!.productCommission.toString()}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp),
                                  ),


                            ],
                          ),
                        ),
                      );
  }

  Container buildContainer() {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10).r,
          color: Colors.grey.shade900),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp),
                ),
                Text(
                  userController.product!.productName,
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ],
            ),
            VerticalDivider(
              color: Colors.white,
              thickness: 2.w,
              //width: 13,
              endIndent: 8.h,
              indent: 8.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp),
                ),
                Text(
                  '\$ ${userController.product!.productPrice.toString()}',
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
