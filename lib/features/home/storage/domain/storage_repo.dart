import 'dart:typed_data';

abstract class StorageRepo {

  Future<String?> uploadPostImageMob (String path,String fileName );
  Future<String?> uploadPostImageWeb (Uint8List fileBytes,String path);
}