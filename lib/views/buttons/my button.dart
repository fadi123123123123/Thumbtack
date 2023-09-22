

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton  {

 static ElevatedButton myElevatedButton (String text , Function function){
    return ElevatedButton(
      onPressed: function(),
      child: Text(text , style: TextStyle(fontSize: 18),),
      style: ElevatedButton.styleFrom(
        primary: Colors.teal, // Background color
        onPrimary: Colors.white, // Text color
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        elevation: 5, // Elevation when pressed
      ),
    );
  }

  static GestureDetector myCustomButton(String text , Function function){
   return GestureDetector(
     onTap:(){
       function();
     },
     child: Container(
       height: 35.h,
       width: 280.w,
       child: Center(child: Text(text , style: TextStyle(color: Colors.white , fontSize: 22.sp),)),
       decoration: BoxDecoration(
           color: Colors.black,
         borderRadius: BorderRadius.circular(20),
         border:Border.all(
           color: Colors.white,
           width: 2
         ),
       )
     ),
   );
  }

}