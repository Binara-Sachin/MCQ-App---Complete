import 'package:firebase_auth/firebase_auth.dart';
import 'package:mcq_app/core/services/database.dart';

import '../models/user_model.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //create User obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser firebaseUser) {
    if (firebaseUser != null) {
      User user = new User(uid: firebaseUser.uid);
      return user;
    }
    return null;
  }

  //auth change user stream
  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in anonymously
  Future signInAnonymously() async {
    try {
      AuthResult authResult = await _firebaseAuth.signInAnonymously();
      FirebaseUser firebaseUser = authResult.user;

      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  //sign in with Email & Password
  Future signIn(String email, String password) async {
    try {
      AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;

      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  //register with Email & Password
  Future signUp(String email, String password) async {
    try {
      AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;

      //create a new document for the user
      await DatabaseService(uid: firebaseUser.uid).updateUserData(email, password, false);

      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());

      return null;
    }
  }
}
