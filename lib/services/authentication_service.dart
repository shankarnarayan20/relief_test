import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:relief_test/locator.dart';
import 'package:relief_test/services/firestore_service.dart';
import 'package:relief_test/models/user.dart';

class AuthenticationService {


final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final FirestoreService _firestoreService = locator<FirestoreService>();

User _currentUser;
User get currentUser => _currentUser;

  Future loginwithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authresult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return authresult.user != null;
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
      _currentUser = User(
          authresult.user.uid, fullname, email, phonenumber, address, location,0);
      await _firestoreService.createUser(_currentUser);
      return authresult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) _currentUser = await _firestoreService.getUser(user.uid);
  }
}
