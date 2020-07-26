import 'package:designers_meet/global.dart';
import 'package:designers_meet/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerHomeScreen extends StatefulWidget {
  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  final _auth = AuthService();
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
              onPressed: () async {
                await _auth.signOut();
                print('Signed out.');
              },
              child: Icon(Icons.exit_to_app))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 60.w),
        child: Text(
          'Customer Home Screen',
          style: TextStyle(fontSize: 45.sp),
        ),
      ),
    );
  }
}
