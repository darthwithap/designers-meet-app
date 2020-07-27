import 'package:designers_meet/models/user.dart';
import 'package:designers_meet/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String error = "";

  String getError() {
    return this.error;
  }

  void setError(String e) {
    switch (e) {
      case "ERROR_INVALID_EMAIL":
        error = "Invalid email address";
        break;
      case "ERROR_WRONG_PASSWORD":
        error = "Incorrect Password";
        break;
      case "ERROR_USER_NOT_FOUND":
        error = "User with this email doesn't exist";
        break;
      case "ERROR_USER_DISABLED":
        error = "User with this email has been disabled";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        error = "Too many requests. Try again later";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        error = "Operation not allowed";
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        error = "User with this email already exists";
        break;
      case "ERROR_INVALID_CREDENTIAL":
        error = "Incorrect email or password";
        break;
      default:
        error = "An undefined error occurred";
    }
  }

  // covert firebase user to custom user
  User _userFromFirebaseUser(FirebaseUser firebaseUser) {
    return firebaseUser != null ? User(uid: firebaseUser.uid) : null;
  }

  // auth change user stream
  Stream<User> get currentUser =>
      _auth.onAuthStateChanged.map(_userFromFirebaseUser);

  // sign in anonymously
  Future<User> signInAnonymously() async {
    error = "";
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      // ignore: todo
      // TODO: Toast to show error
      setError(e.code);
      print("Error signin anonymously: ${e.code}");
      return null;
    }
  }

  // sign in with email and password
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    error = "";
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      setError(e.code);
      print("Error signing in: ${e.code}");
      return null;
    }
  }

  // sign up with email and password
  Future<User> signUpWithEmailAndPassword(
      String email, String password, String name) async {
    error = "";
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid)
          .updateUserData(name, "9999999999", 0, 1);
      return _userFromFirebaseUser(user);
    } catch (e) {
      setError(e.code);
      print("Error signing up: ${e.code}");
      return null;
    }
  }

  // signout
  Future signOut() async {
    error = "";
    try {
      return await _auth.signOut();
    } catch (e) {
      setError(e.code);
      print('Error signing out: ${e.code}');
      return null;
    }
  }
}
