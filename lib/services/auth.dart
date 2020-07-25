import 'package:designers_meet/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // sign in anonymously
  Future<User> signInAnonymously() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      // ignore: todo
      // TODO: Toast to show error
      print("Error: ${e.toString()}");
      return null;
    }
  }

  User _userFromFirebaseUser(FirebaseUser firebaseUser) {
    return firebaseUser != null ? User(uid: firebaseUser.uid) : null;
  }

  // sign in with email and password

  // sign up with email and password

  // logout
}
