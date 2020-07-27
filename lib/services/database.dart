import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');
  
  Future updateUserData(String name,  int type, ) {

  }
}
