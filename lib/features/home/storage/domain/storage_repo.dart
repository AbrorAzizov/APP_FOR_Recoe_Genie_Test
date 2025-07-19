import 'dart:typed_data';

abstract class StorageRepo {
  Future<String?> uploadProfileImageMob (String path,String fileName );
  Future<String?> uploadProfileImageWeb (Uint8List fileBytes,String path);
  Future<String?> uploadPostImageMob (String path,String fileName );
  Future<String?> uploadPostImageWeb (Uint8List fileBytes,String path);
}