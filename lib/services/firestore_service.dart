import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:relief_test/models/donation_model.dart';
import 'package:relief_test/models/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  final CollectionReference _donationsCollectionReference =
      Firestore.instance.collection('donations');

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      if (e is PlatformException) return e.message;
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
    } catch (e) {
      if (e is PlatformException) return e.message;
      return e.message;
    }
  }

  Future addDonations(Donations donations) async {
    try {
      await _donationsCollectionReference.add(donations.toMap());
    } catch (e) {
      if (e is PlatformException) return e.message;
      return e.message;
    }
  }
}
