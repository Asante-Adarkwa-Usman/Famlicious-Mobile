import 'dart:io';

import 'package:famlicious_app/services/file_upload_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthManager with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FileUploadService _fileUploadService = FileUploadService();

  String _message = '';
  bool _isLoading = false;
  //getter
  String get message => _message;
  bool get loading => _isLoading;
//setter
  setMessage(String message) {
    _message = message;
    notifyListeners();
  }

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

//create user at firebase
  createNewUser(
      {required String name,
      required String email,
      required File imageFile,
      required String password}) async {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((userCredential) async {
         String? photoUrl = await _fileUploadService.uploadFile(file: imageFile userUid: userCredential.user!.uid);
         if (photoUrl != null) {
           //add user info to firestore (name, email, photo, uid, createdAt)
         }else{
         setMessage('Image upload failed');
         }
        })
        .catchError((onError) {
           setMessage('$onError');
        })
        .timeout(const Duration(seconds: 60), onTimeout: (){});
  }
}
