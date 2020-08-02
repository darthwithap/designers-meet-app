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
      int gender, int type, int size, String location) async {
    return await userCollection.document(this.uid).setData({
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'type': type, 
      'size': size,
      'location': location
    });
  }

  Future addUserData(String uid, String name, String email, int type) async {
    return await userCollection.document(this.uid).setData({
      'uid': uid,
      'name': name,
      'email': email,
      'type': type
    });
  }

  // user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'] ?? 'John Smith  ',
        email: snapshot.data['email'] ?? 'youremail@domain.com',
        phone: snapshot.data['phone'] ?? '9999999999',
        gender: snapshot.data['gender'] ?? -1,
        type: snapshot.data['type'] ?? -1,
        size: snapshot.data['size'] ?? 2);
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

  // get user doc stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
 