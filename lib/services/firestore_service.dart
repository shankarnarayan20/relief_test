import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:relief_test/models/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');
  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      print(e);
    }
  }
}
