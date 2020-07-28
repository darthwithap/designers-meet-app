import 'package:designers_meet/models/user.dart';
import 'package:designers_meet/screens/customer/user_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerList extends StatefulWidget {
  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    //TODO: replace this with customers collection
    final users = Provider.of<List<User>>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CustomerTile(user: users[index]) ;
      },
      itemCount: users.length,
    );
  }
}
