import 'package:designers_meet/global.dart';
import 'package:designers_meet/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: kBgWhiteColor,
      appBar: AppBar(
        backgroundColor: kBgWhiteColor,
        elevation: 0.0,
        title: Text(
          'The Designer\'s Meet',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 60.w),
        child: RaisedButton(
          onPressed: () async {
            dynamic result = await _auth.signInAnonymously();
            if (result == null)
              print('Error Signing in');
            else
              print('Signed in and uid is: ${result.uid}');
          },
          child: Text('Sign in as a guest'),
        ),
      ),
    );
  }
}
