import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../domain/storage_repo.dart';

class FirebaseStorageRepo implements StorageRepo{
  final storage = FirebaseStorage.instance;

  @override
  Future<String?> uploadProfileImageMob(String path, String fileName) {
    return _uploadFile(path, 'profile_image', fileName);
  }

  @override
  Future<String?> uploadProfileImageWeb(Uint8List fileBytes, String fileName) {

    return _uploadFileBytes(fileBytes, 'profile_image', fileName);
  }

  @override
  Future<String?> uploadPostImageMob(String path, String fileName) {
    return _uploadFile(path, 'post', fileName);
  }

  @override
  Future<String?> uploadPostImageWeb(Uint8List fileBytes, String path) {
    return _uploadFileBytes(fileBytes, 'post', fileName);
  }

  Future<String?> _uploadFile (String path, String folder, String fileName)async{
    try{
      final file = File(path);
      final storageRef = storage.ref('$folder/$fileName');
      final uploadImage = await storageRef.putFile(file);
      final imageUrl = uploadImage.ref.getDownloadURL();
      return imageUrl;
    }catch (e){
      debugPrint('$e') ;
      return null;
    }

  }

  Future<String?> _uploadFileBytes (Uint8List fileBytes, String folder, String fileName)async{
    try{
      final storageRef = storage.ref('$folder/$fileName');
      final uploadImage = await storageRef.putData(fileBytes);
      final imageUrl = uploadImage.ref.getDownloadURL();
      return imageUrl;
    }catch (e){
      debugPrint('$e') ;
      return null;
    }

  }


}



