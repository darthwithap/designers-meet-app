import 'package:designers_meet/global/constants.dart';
import 'package:designers_meet/models/user.dart';
import 'package:designers_meet/screens/customer/settings_form.dart';
import 'package:designers_meet/screens/customer/user_list.dart';
import 'package:designers_meet/services/auth.dart';
import 'package:designers_meet/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomerHomeScreen extends StatefulWidget {
  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  final _auth = AuthService();
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    void _showUserSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 50.w),
              child: CustomerSettingsForm(),
            );
          });
    }

    return StreamProvider<List<User>>.value(
      value: DatabaseService().users,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'The Designer\'s Meet',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: kBgWhiteColor,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          actions: <Widget>[
            MaterialButton(
                onPressed: () => _showUserSettingsPanel(),
                child: Icon(Icons.settings)),
            FlatButton(
                onPressed: () async {
                  await _auth.signOut();
                  //globalActiveUser = null;
                  print('Signed out.');
                },
                child: Icon(Icons.exit_to_app)),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 60.w),
          child: Column(
            children: <Widget>[
              Text(
                'Customer Home Screen',
                style: TextStyle(fontSize: 45.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomerList()
            ],
          ),
        ),
      ),
    );
  }
}
