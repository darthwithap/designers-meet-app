import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(String name, String phone, int gender, int type) async {
    return await userCollection.document(uid).setData(
        {'name': name, 'phone': phone, 'gender': gender, 'type': type});
  }

  // get users stream
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
