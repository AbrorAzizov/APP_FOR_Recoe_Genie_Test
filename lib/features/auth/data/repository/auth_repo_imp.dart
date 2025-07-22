import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../domain/repo/auth_repo.dart';
import '../models/sign_up_parameters.dart';

class AuthRepoImp implements AuthRepo {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Future<bool> isLoggedIn() async{
    final user =  FirebaseAuth.instance.currentUser;
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<Either> logout() async{
    try{
      await FirebaseAuth.instance.signOut();
      return Right(unit);
    }  on FirebaseAuthException catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> signIn(UserModel user) async{
    final email = user.email;
    final password = user.password;

    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final currentUser = userCredential.user;
      if(currentUser == null) {
        return Left("User not found");
      }

      return Right(Unit);
    } on FirebaseAuthException catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> signUp(UserModel user) async{
    final email = user.email;
    final password = user.password;
    final name = user.name;

    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final currentUser = userCredential.user;

      if(currentUser == null) {
        return Left("User not found");
      }

      await FirebaseFirestore.instance.collection('user').doc(currentUser.uid).set(
          {
            'password':password,
            'email':email,
            'name': name,
            'created_at': Timestamp.now(),
          });
      return Right(Unit);
    } on FirebaseAuthException catch (e) {
      return Left(e.toString());
    }
  }
}

