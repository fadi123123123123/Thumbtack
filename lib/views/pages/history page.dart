import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project1/controllers/user%20controller.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  DateTime currentDate = DateTime.now(); // current date

  UserController userController = Get.find();

  int selectedDay =
      0; // i create it for the GestureDetector to know who user select a specific date go to line 96

  Map<int, String> monthsInYear = {
    1: "January",
    2: "February",
    3: "March",
    4: 'April',
    5: "May",
    6: 'June',
    7: 'Juli',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: "December"
  };

  int daysInMonth = DateUtils.getDaysInMonth(
      DateTime.now().year, DateTime.now().month); // numer the days in a month

  List<String> DayNamesInMonthList = []; // names of the days in a month

  List<String> getDayNamesInMonth(DateTime month) {
    // get names of the dayes in a specific date
    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);
    final dateFormat = DateFormat.E(); // 'E' gives the abbreviated day name

    List<String> dayNames = [];

    for (var day = firstDay;
        day.isBefore(lastDay.add(Duration(days: 1)));
        day = day.add(Duration(days: 1))) {
      dayNames.add(dateFormat.format(day));
    }

    return dayNames;
  }

  @override
  void initState() {
    DayNamesInMonthList = getDayNamesInMonth(DateTime.now());
    super.initState();
  }
  @override
  void dispose() {
    userController.clearProductHistory();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(DayNamesInMonthList);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
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
                        child: Image.asset('assets/images/logo.png', color: Colors.black,),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      
                      GestureDetector(
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: currentDate,
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                          );

                          if (newDate == null) return;
                          print(newDate);
                          setState(() {
                            DayNamesInMonthList = getDayNamesInMonth(newDate!);
                            daysInMonth = DateUtils.getDaysInMonth(
                                newDate!.year, newDate!.month);
                            currentDate = newDate!;
                          });
                        },
                        child: Text(
                          '${monthsInYear[currentDate.month.toInt()]} ${currentDate.year.toString()}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp),
                        ),
                      ),


                      Container(
                          width: double.infinity,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: List.generate(daysInMonth, (index) {
                              //print(index);
                              return Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: GestureDetector(
                                  onTap: () async{

                                    await   userController.getProductsHistory(userController.journeyInfo!.id.toString());
                                    currentDate  = DateTime.parse(currentDate.toString()).toLocal();

                                    setState(() {
                                      selectedDay = index;
                                    });

                                     dynamic dateString = "${currentDate.year}-${currentDate.month.toInt()<10?'0':""}${currentDate.month}-${selectedDay+1.toInt()<10?'0':""}${selectedDay + 1}" ;

                                     await userController.getProductsInThisDate(dateString);



                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30).r,
                                        color: selectedDay == index
                                            ? Colors.black
                                            : Colors.white,
                                        border: Border.all(
                                          color: selectedDay == index
                                              ? Colors.white
                                              : Colors.black,
                                          width: 4.w,
                                        ),
                                      ),
                                      // padding: EdgeInsets.only(left: 10),
                                      width: 120.w,
                                      height: 180.h,
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10.h),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              (index + 1).toString(),
                                              style: TextStyle(
                                                  color: selectedDay == index
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 25.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              DayNamesInMonthList[index],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 20.sp),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            })),
                          )),


                      GetBuilder<UserController>(
                        builder: (_){
                         return userController.isLoading == true ? Center(child: CircularProgressIndicator()):
                             userController.productHistory!.length == 0 ? Center(child: Text("Nothing happened on this day" , style: TextStyle(color: Colors.white , fontSize: 20.sp),)):
                                 Column(
                                   children: List.generate(userController.productHistory.length, (index){
                                    // var inputFormat = DateFormat('dd/MM/yyyy');
                                //   var inputDate = inputFormat.parse(userController.productHistory[index].createdDate);
                                     var localDate = DateTime.parse(userController.productHistory[index].createdDate).toLocal();
                                     var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
                                     var inputDate = inputFormat.parse(localDate.toString());
                                     print(inputDate.minute);
                                     String hour = '${inputDate.hour.toInt()<10?'0${inputDate.hour}':inputDate.hour}';
                                     String minute = '${inputDate.minute.toInt()<10?'0${inputDate.minute}':inputDate.minute}';
                                     String isPm = inputDate.hour.toInt() < 12? 'Am' : 'Pm';
                                     return myContainer(hour+':'+minute, isPm, userController.productHistory[index].productHistoryStatus, userController.productHistory[index].productName, userController.productHistory[index].productPrice, userController.productHistory[index].productCommission);
                                   })
                                 );
                        },
                      ),


                    ],
                  ),
                ),
              ),
            ),
          
          
            // Positioned(
            //   child: CircleAvatar(
            //     maxRadius: 22.h,
            //     backgroundColor: Colors.grey.shade500,
            //     child: IconButton(
            //       onPressed: () {
            //         Get.back();
            //       },
            //       icon: Icon(Icons.arrow_back_ios_new_outlined),
            //       iconSize: 25.h,
            //       color: Colors.black,
            //     ),
            //   ),
            //   top: 30.h,
            //   left: 5.w,
            // ),
          ],
        ),
      ),
    );
  }
}

Container myContainer(String time ,String period,String status  , dynamic gardening , dynamic thumbtackShare , dynamic totalRecived) {
  return  Container(
      padding: EdgeInsets.only(top: 15.h, right: 0.w),
         child:Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${time}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp),
                  ),
                  Text(
                    '${period}',
                    style: TextStyle(color: Colors.white60, fontSize: 14.sp),
                  ),
                ],
              ),
            ), // Time

            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20).r,
                  color: Colors.grey.shade900,
                ),
                child: Padding(
                  padding:  EdgeInsets.all(10.0.w),
                  child: Row(
                    //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(  // Logo
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            scale: 6.h,
                        //  height: 00.h,
                            //width: 100.w,
                            color: Colors.white,
                          )
                        ],
                      ),



                      Container(   // Details
                        width: 210.w,
                        padding: EdgeInsets.only(left: 4.w),
                        child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 100.w),
                                child: Row(
                                  children: [
                                 //   SizedBox(width: 10.w,),
                                    container('${status}'),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "name",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp),
                                  ),
                                  container('${gardening}' ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "price",
                                    style: TextStyle(color: Colors.white, fontSize: 15.sp , fontWeight: FontWeight.bold),
                                  ),
                                  container('\$${thumbtackShare}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "commission",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.sp),
                                  ),
                                  container('\$${totalRecived}'),
                                ],
                              ),
                            ],
                          ),
                      ),

                    ],
                  ),
                ),
              ),

          ],
        ),

    
  );
}

Expanded container(String text ) {
  return Expanded(
    child: Container(

      padding: EdgeInsets.all(4.w),
      margin: EdgeInsets.all(4.w),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r, color: Colors.grey.shade500),
      child: Center(child: Text(text , style: TextStyle(color: Colors.white),)),
    ),
  );
}
