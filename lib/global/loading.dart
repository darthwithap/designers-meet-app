import 'package:designers_meet/global/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      color: Colors.transparent,
      child: Center(
        child: SpinKitFadingCube(
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
