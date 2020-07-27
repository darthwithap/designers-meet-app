import 'package:cloud_firestore/cloud_firestore.dart';
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
    final users = Provider.of<QuerySnapshot>(context);
    print("DOCS\n");
    for (var doc in users.documents) {
      print(doc.data); 
    }
    return Container();
  }
}
