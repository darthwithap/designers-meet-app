import 'package:designers_meet/global/constants.dart';
import 'package:designers_meet/global/loading.dart';
import 'package:designers_meet/services/auth.dart';
import 'package:designers_meet/wrapper.dart';
import 'package:email_validator/email_validator.dart';
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
  String error = "";
  bool hasError = false;
  bool isLoading = false;
  double scaffoldOpacity = 1.0;

  bool isValidPassword(String password) {
    bool exists = password != null && password.isNotEmpty;
    bool hasDigit = password.contains(RegExp(r'[0-9]'));
    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|]'));
    bool hasMinLength = password.length > 9;

    return exists &
        hasDigit &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      AnimatedOpacity(
        opacity: scaffoldOpacity,
        duration: Duration(milliseconds: 20),
        child: Scaffold(
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
                    style:
                        TextStyle(fontSize: 70.sp, fontWeight: FontWeight.bold),
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
                            validator: (val) => EmailValidator.validate(val)
                                ? null
                                : "Enter a valid email",
                            decoration: textFormFieldDecoration.copyWith(
                                hintText: "Your Email"),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          TextFormField(
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                            decoration: textFormFieldDecoration.copyWith(
                                hintText: "Your Password"),
                            validator: (val) => (isValidPassword(val))
                                ? null
                                : "Min 10 chars; mix of upper, lower, digits and special chars",
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          RaisedButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  scaffoldOpacity = 0.3;
                                  isLoading = true;
                                });
                                print("$email & $password");
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email.replaceAll(" ", ""), password);
                                if (result == null) {
                                  setState(() {
                                    error = _auth.getError().toString();
                                    hasError = true;
                                    isLoading = false;
                                    scaffoldOpacity = 1.0;
                                  });
                                } else {
                                  /* globalActiveUser = await Wrapper()
                                      .getCurrentUserObject(result.uid); */
                                  print("Signed in as ${result.uid}");
                                }
                              }
                            },
                            color: kPrimaryColor,
                            child: Text('Sign In'),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Visibility(
                            visible: hasError,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  error,
                                  style: TextStyle(
                                      fontSize: 33.sp, color: Colors.red),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            ),
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
        ),
      ),
      Visibility(visible: isLoading, child: Loading()),
    ]);
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
