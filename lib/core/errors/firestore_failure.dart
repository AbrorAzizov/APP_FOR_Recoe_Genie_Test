import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreFailure {
  final String code;
  final String message;

  FireStoreFailure({required this.code, required this.message});

  factory FireStoreFailure.fromExeption(FirebaseException e) {
    return FireStoreFailure(
        code: e.code, message: e.message ?? "unknown error");
  }
}
