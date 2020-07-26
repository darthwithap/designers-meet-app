import 'package:designers_meet/screens/auth/sign_in.dart';
import 'package:designers_meet/screens/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool showSignIn = true;

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Container(
        child: (showSignIn)
            ? SignIn(
                toggleView: toggleView,
              )
            : SignUp(
                toggleView: toggleView,
              ),
      ),
    );
  }
}
