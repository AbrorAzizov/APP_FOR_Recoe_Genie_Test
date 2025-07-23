import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/repo/auth_repo.dart';
import '../models/sign_up_parameters.dart';

class AuthRepoImp implements AuthRepo {
  final _auth = FirebaseAuth.instance;

  @override
  Future<bool> isLoggedIn() async {
    return _auth.currentUser != null;
  }

  @override
  Future<Either<String, Unit>> logout() async {
    try {
      await _auth.signOut();
      return Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? "Logout failed");
    }
  }

  @override
  Future<Either<String, Unit>> signIn(UserModel user) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      if (userCredential.user == null) {
        return Left("User not found");
      }

      return Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? "Sign in failed");
    }
  }

  @override
  Future<Either<String, Unit>> signUp(UserModel user) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      final currentUser = userCredential.user;
      if (currentUser == null) {
        return Left("User not found");
      }

      await FirebaseFirestore.instance.collection('user').doc(currentUser.uid).set({
        'email': user.email,
        'name': user.name,
        'created_at': Timestamp.now(),
      });
      debugPrint('fire');
      return Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? "Sign up failed");
    }
  }
}
