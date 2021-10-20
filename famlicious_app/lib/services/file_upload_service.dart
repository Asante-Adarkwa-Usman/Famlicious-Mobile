import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FileUploadService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String?> uploadFile({required File file, required String userUid}) async {
    await _firebaseStorage.ref().child('profile_images').child('$userUid.jpg');

   try{
   UploadTask storageUploadTask = _firebaseStorage.ref().child('profile_images').
    child('$userUid.jpg')
    .putFile(file);
return storageUploadTask.snapshot.ref.getDownloadURL();
   }on FirebaseException catch(e){
   return null;
   }


    
  }
}
