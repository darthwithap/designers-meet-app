import 'package:designers_meet/global/constants.dart';
import 'package:designers_meet/screens/auth/auth.dart';
import 'package:designers_meet/screens/customer/home.dart';
import 'package:designers_meet/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

class Wrapper extends StatelessWidget {
  // set activeUser globally
  void getCurrentUserObject(String uid) {
    var doc = DatabaseService().userCollection.document(uid);
    doc.get().then((doc) {
      User().getUserFromData(doc.data);
    });
  }

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
