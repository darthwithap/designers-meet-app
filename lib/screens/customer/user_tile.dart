import 'package:designers_meet/global/constants.dart';
import 'package:designers_meet/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerTile extends StatelessWidget {
  final User user;

  CustomerTile({this.user});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 50.sp,
            backgroundColor: kPrimaryColor,
          ),
          title: Text(user.name, style: TextStyle(color: Colors.black),),
          subtitle: Text(user.email),
        ),
      ),
    );
  }
}
