// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({
    required this.uid,
  });

  final CollectionReference userCollections =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference groupCollections =
      FirebaseFirestore.instance.collection("groups");

  Future savingUserData(String name, String email) async {
    return await userCollections.doc(email).set({
      "name": name,
      "email": email,
      "score": 0,
      "uid": uid,
    });
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollections.where('email', isEqualTo: email).get();
    return snapshot;
  }
}
