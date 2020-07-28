import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:designers_meet/global/constants.dart';
import 'package:designers_meet/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  User _user;

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(String uid, String name, String email, String phone,
      int gender, int type) async {
    return await userCollection.document(this.uid).setData({
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'type': type
    });
  }

  // user list from snapshot
  List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      print("LIST SNAPSHOT: ${doc.data}");
      return User().getUserFromData(doc.data);
    }).toList();
  }

  // get users stream
  Stream<List<User>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
}
