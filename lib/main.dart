import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project1/binding/my%20binding.dart';
import 'package:project1/middleware/error%20middleware.dart';
import 'package:project1/middleware/signInMiddleware.dart';
import 'package:project1/services/settings%20services.dart';
import 'views/pages/error page.dart';
import 'views/pages/mission success page.dart';
import 'views/pages/mission unsuccess oage.dart';
import 'views/pages/password setting page.dart';
import 'views/pages/swipe page.dart';
import 'views/pages/front page.dart';
import 'views/pages/history page.dart';
import 'views/pages/home page.dart';
import 'views/pages/landing page.dart';
import 'views/pages/sign in page.dart';
import 'views/pages/sign up page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'views/pages/task page.dart';
import 'views/pages/verification screen page.dart';
import 'views/pages/wallet saving page.dart';
import 'views/pages/withdrawal password settings page.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  await initServices();
  runApp(MyApp());
}

Future initServices()async{
  await Get.putAsync(() => SettingsServices().init());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    // print('Height is : ${mq.height}');
    // print('Width is : ${mq.width}');
    // print('****');
    return ScreenUtilInit(
        designSize:const  Size(360.0, 690.0),
    //  designSize: Size(mq.width , mq.height),
      minTextAdapt: true,
      splitScreenMode: true,
        builder: (context, widget) {
       //   ScreenUtil.init(context);
          return GetMaterialApp(
            title: 'Thumbtack',
            initialBinding: MyBinding(),
            debugShowCheckedModeBanner: false,
            //  home: SignUpPage(),
            initialRoute: '/signUpPage',
            getPages: [
              GetPage(name:'/signUpPage' , page: () => SignUpPage() , middlewares: [SignInMiddleware() , ErrorMiddleWare()]),
              GetPage(name:'/signInPage' , page: () => SignInPage()),
              GetPage(name:'/verificationScreenPage' , page: () => VerificationScreenPage()),
              GetPage(name:'/landingPage' , page: () => LandingPage()),
              GetPage(name:'/frontPage' , page: () => FrontPage()),
              GetPage(name:'/homePage' , page: () => HomePage()),
              GetPage(name:'/historyPage' , page: () => HistoryPage()),
              GetPage(name:'/swipePage' , page: () => SwipePage()),
              GetPage(name:'/taskPage' , page: () => TaskPage()),
              GetPage(name:'/missionSuccessPage' , page: () => MissionSuccessPage()),
              GetPage(name:'/missionUnSuccessPage' , page: () => MissionUnSuccessPage()),
              GetPage(name:'/passwordSettingsPage' , page: () => PasswordSettingsPage()),
              GetPage(name:'/withdrawalPasswordSettingsPage' , page: () => WithdrawalPasswordSettingsPage()),
              GetPage(name:'/walletSavingPage' , page: () => WalletSavingPage()),
              GetPage(name:'/errorPage' , page: () => ErrorPage()),
            ],
          );

        }
        );
  }
}
