import 'package:amazon_clone/model/user_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreClass {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadUserData({required UserDetialsModel user}) async {
    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid).set(user.getJson());
  }
}
