import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:relief_test/locator.dart';
import 'package:relief_test/services/firestore_service.dart';
import 'package:relief_test/models/user.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final FirestoreService _firestoreService = locator<FirestoreService>();

class AuthenticationService {
  Future loginwithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signupwithEmail({
    @required String email,
    @required String password,
    @required String fullname,
    @required String phonenumber,
    @required String address,
    @required String location,
  }) async {
    try {
      var authresult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestoreService.createUser(User(
        authresult.user.uid,
        fullname,
        email,
        phonenumber,
        address,
        location,
      ));
      return authresult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    return user != null;
  }
}
