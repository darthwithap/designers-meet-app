import 'package:designers_meet/global.dart';
import 'package:designers_meet/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;


  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Sign In',
                style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.bold),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40.h,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {}
                        },
                        color: kPrimaryColor,
                        child: Text('Sign In'),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: 20.w,
                            ),
                            Row(
                              children: <Widget>[
                                Text('Don\'t have an account?'),
                                SizedBox(
                                  width: 30.w,
                                ),
                                GestureDetector(
                                  onTap: widget.toggleView,
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: 40.sp,
                                        fontWeight: FontWeight.w600,
                                        color: kPrimaryColor),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                          ]),
                    ],
                  )),
            ],
          )),
    );
  }
}

// RaisedButton(
//           onPressed: () async {
//             dynamic result = await _auth.signInAnonymously();
//             if (result == null)
//               print('Error Signing in');
//             else
//               print('Signed in user: ${result.uid}');
//           },
//           child: Text('Sign in as a guest'),
//         ),
