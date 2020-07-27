import 'package:designers_meet/global/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesignerHomeScreen extends StatefulWidget {
  @override
  _DesignerHomeScreenState createState() => _DesignerHomeScreenState();
}

class _DesignerHomeScreenState extends State<DesignerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Designer\'s Meet',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: kBgWhiteColor,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.exit_to_app),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 60.w),
        child: Text(
          'Designer Home Screen',
          style: TextStyle(fontSize: 45.sp),
        ),
      ),
    );
  }
}
