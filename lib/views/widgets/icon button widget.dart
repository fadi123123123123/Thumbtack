import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyIconButton extends StatefulWidget {
  IconData? icon ;
  Function? function ;
   MyIconButton({this.icon , this.function});

  @override
  State<MyIconButton> createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return  IconButton(
      selectedIcon: Text("asd",style: TextStyle(color: Colors.white ),),
      icon: Icon(
        widget.icon,
        size: 25.h,
        color: Colors.orange,
      ),
      onPressed: () {
        widget.function!();
      },
    );
  }
}
