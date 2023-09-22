import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/user%20controller.dart';
import 'package:project1/views/buttons/my%20button.dart';

class MissionUnSuccessPage extends StatelessWidget {
  MissionUnSuccessPage({super.key});
  UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 80.h, left: 15.w, right: 15.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo_text.png',
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Container(
                        //     height: 200.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25).r,
                            color: Colors.white  //mission_unsuccess.png
                        ),
                        child:
                        Column(
                          children: [

                            Image.asset('assets/images/mission_unsuccess.png',),

                            Stack(
                                alignment: Alignment.topCenter,
                                children:[
                                  Image.asset('assets/images/mission_success1.png'),
                                  Text('Job is still not assign yet!' ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20.sp),)
                                ]
                            ),

                            GestureDetector(
                              onTap:(){
                                userController.setCurrentPage(1);
                                Get.offAllNamed('/frontPage');
                              },
                              child: Container(
                                  margin: EdgeInsets.all(20.h),
                                  height: 40,
                                  width: 300,
                                  child: Center(child: Text("Checkout" , style: TextStyle(color: Colors.black , fontSize: 25),)),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border:Border.all(
                                        color: Colors.black,
                                        width: 1
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),

                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      Padding(
                        padding:  EdgeInsets.all(8.0.w),
                        child: Text(
                          'Kindly check your account balance for job assignig',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),


                      SizedBox(
                        height: 25.h,
                      ),

                      Text(
                        'Thanks for assign job to our Thumbtack Pro.',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                      ),

                      SizedBox(
                        height: 5.h,
                      ),

                      Text(
                        'Your help would be greatly appreciated.',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                      ),

                      SizedBox(
                        height: 5.h,
                      ),

                      Text(
                        'Reminder:Please remember to claim the reward.',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                      ),


                    ],
                  ),
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
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Plumb repairing',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp),
            ),


            VerticalDivider(
              color: Colors.white,
              thickness: 2.w,
              //width: 13,
              endIndent: 1.h,
              indent: 1.h,
            ),

            Text(
              '\$18.50',
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
                  'Plumb repairing',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp),
                ),
                Text(
                  'Thumbtack Share',
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
                  '\$18.50',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp),
                ),
                Text(
                  '\$30.50',
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
