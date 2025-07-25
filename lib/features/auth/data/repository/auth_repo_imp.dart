import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/repo/auth_repo.dart';
import '../models/signin_params.dart';
import '../models/signup_params.dart';

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
  Future<Either<String, Unit>> signIn(SignInParameters user) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      if (userCredential.user == null) {
        debugPrint("User not found");

        return Left("User not found");
      }

      return Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? "Sign in failed");
    }
  }

  @override
  Future<Either<String, Unit>> signUp(SignUpParameters user) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      final currentUser = userCredential.user;
      if (currentUser == null) {
        return Left("User not found");
      }

      final _userUid = _auth.currentUser!.uid;
      await FirebaseFirestore.instance.collection('user').doc(currentUser.uid).set({
        'email': user.email,
        'username': user.username,
        'created_at': Timestamp.now(),
        'uid': _userUid
      });

      debugPrint('fire');
      return Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? "Sign up failed");
    }
  }
}
