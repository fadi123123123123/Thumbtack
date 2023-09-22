import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/controllers/sign%20up%20controller.dart';
import 'package:project1/controllers/user%20controller.dart';
import 'package:project1/views/pages/home%20page.dart';
import 'package:project1/views/pages/return%20to%20front%20%20page.dart';
import 'package:project1/views/pages/withdrawal%20password%20settings%20page.dart';

import '../../models/http helper  model.dart';
import '../../services/settings services.dart';
import '../widgets/icon button widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'history page.dart';
import 'password setting page.dart';
import 'swipe page.dart';
import 'wallet saving page.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});
  @override
  State<FrontPage> createState() => _FrontPageState();
}




class _FrontPageState extends State<FrontPage> {
  int currentIndex = 0;
  UserController userController = Get.find();

  SettingsServices settingsServices = Get.find();

@override
  void initState() {
  print("THe result is hereeeeee : ${userController.userInfo.walletAddress}");
  userController.isShowBottmSheet == true?
  WidgetsBinding.instance?.addPostFrameCallback((_) {
    Get.bottomSheet(
      isScrollControlled: true,
      isDismissible: true,

      Container(
        padding: EdgeInsets.only(left: 20.w , right: 20.w , top: 10.w),

        // height: 200,
        //color: Colors.black.withOpacity(0.6),
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo_text.png' , color: Colors.white,),
              SizedBox(height: 10.h,),
              Text('is rated Great',  style: TextStyle(color: Colors.white , fontSize: 30.sp),),
              SizedBox(height: 10.h,),
              Text('Base on 5,911',  style: TextStyle(color: Colors.white , fontSize: 20.sp),),
              SizedBox(height: 10.h,),
              Image.asset('assets/images/rating_logo.png' ,),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star , color: Color.fromRGBO(0,182,122, 1) , size: 20.h,),
                  Image.asset('assets/images/raiting_text.png' , width: 100.w,)
                ],
              ),

              SizedBox(height: 10.h,),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Colors.white),
                ),
                width: 330.w,
                //  height: 100.h,
                //height: 40.h,
                // padding: const EdgeInsets.all(16.0,),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Notice",
                      style: TextStyle(fontSize: 28.0.sp , color: Color.fromRGBO(175,175,175, 1),decoration: TextDecoration.underline),
                    ),

                    Container(
                      padding: EdgeInsets.all(17.w),
                      child:Text(
                        "ThumbtackPro privilegeFor Every Thumbtack Member that is Complete their job in Hot time 12pm-3pm (GMT -4.00 )Will get extra paid for the job everyday",
                        style: TextStyle(fontSize: 15.0.sp , color: Color.fromRGBO(175,175,175, 1)),
                      ) ,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),


              Image.asset('assets/images/prize.png' , color: Colors.blue, height: 70.h,width: 70.w,),

              Text('Top Pro',  style: TextStyle(color: Colors.white , fontSize: 50.sp),),
              Image.asset('assets/images/logo_text.png' , color: Colors.white,width: 120.w,),


            ],
          ),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.9),
      //  isDismissible: false,
    );
  }): null;
  userController.isShowBottmSheet = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset : false,
        floatingActionButton: Container(
          height: 55.0.h,
          width: 55.0.w,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Colors.yellow[700],
              onPressed: () {
             //  Get.toNamed('/swipePage');
                userController.setCurrentPage(2);

              },
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png', color: Colors.black,

                ),
              ), //icon inside button
            ),
          ),
        ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
       //   margin: EdgeInsets.only(left: 40.w, right: 40.w),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
            ),

            child: BottomAppBar(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              color: Colors.grey.shade900,
              shape: CircularNotchedRectangle(),
              notchMargin: 3,
              child: Container(
                height: 60.h,
             //   margin: EdgeInsets.only(left:  20 , right:  20),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                         //     Get.toNamed('/homePage');

                              userController.setCurrentPage(0);


                            },
                            child: Image.asset('assets/images/home_icon.png',width: 43.w,height: 43.h,),
                          ),
                          Text('Home' , style: TextStyle(color: Colors.white , fontSize:11.sp),)
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                            //  Get.toNamed('/historyPage');


                              userController.setCurrentPage(1);

                            },
                            child: Image.asset('assets/images/history_icon.png',width: 40.w,height: 40.h,),
                          ),
                          Text('History' , style: TextStyle(color: Colors.white , fontSize:11.sp ),)
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                            //  Get.toNamed('/passwordSettingsPage');

                              userController.setCurrentPage(3);

                            },
                            child: Image.asset('assets/images/settings_icon.png',width: 40.w,height: 40.h,),
                          ),
                          Text('Setting' , style: TextStyle(color: Colors.white , fontSize:11.sp),)
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // MyIconButton(
                          //   icon: Icons.account_balance_wallet,
                          //   function: () {
                          //    Get.toNamed('/walletSavingPage');
                          //   },
                          // ),
                          GestureDetector(
                            onTap: (){
                           //   Get.toNamed('/walletSavingPage');
                              userController.setCurrentPage(4);

                            },
                            child: Image.asset('assets/images/withdrawal_icon.png',width: 38.w,height: 38.h,),
                          ),
                          
                          Text('Withdraw' , style: TextStyle(color: Colors.white , fontSize:11.sp),)
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
        body:GetBuilder<UserController>(
          builder: (_){
            return         userController.currentPage==0? ReturnToFrontPage() :userController.currentPage == 1? HistoryPage() :userController.currentPage ==2 ?SwipePage():userController.currentPage == 3? PasswordSettingsPage():userController.currentPage == 4?WalletSavingPage():WithdrawalPasswordSettingsPage();

          },
        )


    );
  }
}
