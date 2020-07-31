import 'package:designers_meet/global/constants.dart';
import 'package:designers_meet/screens/auth/auth.dart';
import 'package:designers_meet/screens/customer/home.dart';
import 'package:designers_meet/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  /* Future<User> getCurrentUserObject(String uid) async {
    var _user;
    var doc = await DatabaseService().userCollection.document(uid).get();
    _user = await User().getUserFromData(doc.data);
    print(" user: ${_user.email}");
    return _user;
  } */

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final currentUser = Provider.of<FirebaseUser>(context);
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
