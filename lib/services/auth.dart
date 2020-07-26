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
      print("Error signin anonymously: ${e.toString()}");
      return null;
    }
  }

  // covert firebase user to custom user
  User _userFromFirebaseUser(FirebaseUser firebaseUser) {
    return firebaseUser != null ? User(uid: firebaseUser.uid) : null;
  }

  // auth change user stream
  Stream<User> get currentUser =>
      _auth.onAuthStateChanged.map(_userFromFirebaseUser);

  // sign in with email and password

  // sign up with email and password
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {}
  }

  // signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('Error signing out: ${e.toString()}');
      return null;
    }
  }
}
