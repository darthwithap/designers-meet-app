import 'package:designers_meet/global/constants.dart';
import 'package:designers_meet/models/user.dart';
import 'package:designers_meet/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  int   _currentSize;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData> (
      //stream: DatabaseService(uid:  ).userData,
      builder: (context, snapshot) {
        return Form(
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
                    style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextFormField(
                    initialValue: _currName,
                    decoration:
                        textFormFieldDecoration.copyWith(hintText: "Your Name"),
                    onChanged: (val) => setState(() => _currName = val),
                    validator: (val) =>
                        (val.isNotEmpty) ? null : 'Name cannot be blank',
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  DropdownButtonFormField(
                    items: locations
                        .map((loc) => DropdownMenuItem(
                              child: Text('$loc'),
                              value: loc,
                            ))
                        .toList(),
                    onChanged: (val) => setState(() => _currLocation = val),
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
                    }, value: (_currentSize ?? 2).toDouble(),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50.sp),
                child: RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      print(_currLocation);
                      print(_currName);
                    }
                  },
                  color: kPrimaryColor,
                  child: Text('Save Changes'),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
