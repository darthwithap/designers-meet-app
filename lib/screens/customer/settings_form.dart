import 'dart:async';

import 'package:designers_meet/global/constants.dart';
import 'package:designers_meet/global/loading.dart';
import 'package:designers_meet/models/user.dart';
import 'package:designers_meet/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomerSettingsForm extends StatefulWidget {
  @override
  _CustomerSettingsFormState createState() => _CustomerSettingsFormState();
}

class _CustomerSettingsFormState extends State<CustomerSettingsForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> locations = [
    'Delhi',
    'Mumbai',
    'Hyderbad',
    'Pune',
    'Chennai',
    'Bangalore',
    'Kolkata'
  ];
  String _currName;
  String _currLocation;
  int _currentSize;
  double formOpacity = 1.0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<FirebaseUser>(context);
    UserData userData;

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: currentUser.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            userData = snapshot.data;
            return Stack(children: <Widget>[
              AnimatedOpacity(
                duration: Duration(microseconds: 20),
                opacity: formOpacity,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'Change user settings',
                            style: TextStyle(
                                fontSize: 50.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          TextFormField(
                            initialValue: userData.name,
                            decoration: textFormFieldDecoration.copyWith(
                                hintText: "Your Name"),
                            onChanged: (val) => setState(() => _currName = val),
                            validator: (val) => (val.isNotEmpty)
                                ? null
                                : 'Name cannot be blank',
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          DropdownButtonFormField(
                            value: userData.location,
                            items: locations
                                .map((loc) => DropdownMenuItem(
                                      child: Text('$loc'),
                                      value: loc,
                                    ))
                                .toList(),
                            onChanged: (val) =>
                                setState(() => _currLocation = val),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Slider(
                            min: 0,
                            max: 5,
                            divisions: 5,
                            inactiveColor: kPrimaryColor43,
                            activeColor: kPrimaryColor.withOpacity(0.75),
                            onChanged: (val) {
                              setState(() => _currentSize = val.toInt());
                            },
                            value: (_currentSize ?? userData.size).toDouble(),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 50.sp),
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                formOpacity = 0.3;
                                isLoading = true;
                              });
                              await DatabaseService(uid: currentUser.uid)
                                  .updateUserData(
                                      currentUser.uid,
                                      _currName ?? userData.name,
                                      userData.email,
                                      userData.phone ?? "NOT_SET",
                                      userData.gender ?? -1,
                                      userData.type ?? -1,
                                      _currentSize ?? userData.size ?? -1,
                                      _currLocation ??
                                          userData.location ??
                                          "NOT_SET ");
                              setState(() {
                                isLoading = false;
                                formOpacity = 1.0;
                              });
                              Timer(Duration(milliseconds: 143),
                                  () => Navigator.pop(context));
                            }
                          },
                          color: kPrimaryColor,
                          child: Text('Save Changes'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                child: Loading(),
                visible: isLoading,
              )
            ]);
          } else {
            return Loading();
          }
        });
  }
}
