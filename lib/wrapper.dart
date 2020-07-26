import 'package:designers_meet/models/user.dart';
import 'package:designers_meet/screens/auth/auth.dart';
import 'package:designers_meet/screens/customer/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final currentUser = Provider.of<User>(context);
    if (currentUser == null) {
      print("No user logged in");
      return Auth();
    } else {
      print("Current user: ${currentUser.uid}");
      return CustomerHomeScreen(); 
    }
    // no login
    return Auth();
  }
}
