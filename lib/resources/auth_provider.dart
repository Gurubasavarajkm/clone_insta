import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
// import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'Some error Occured';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {

        // register User
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photourl = await StorageMethods().updateImageToStorage(
            childName: 'ProfilePictures', file: file, isPost: false);

        // adding user details to the database
        await _firestore.collection('user').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photo': photourl,
        });
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> logInUser({required String email, required password}) async
  {
    String res = 'Some error has occured';
    if(email.isNotEmpty || password.isNotEmpty)
    {
      try{
          _auth.signInWithEmailAndPassword(email: email, password: password);
          res = 'success';
      }
      catch (e){
          //
      }
    }

    return res;
  }

}
