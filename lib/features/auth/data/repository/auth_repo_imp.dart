import 'package:dartz/dartz.dart';


import '../../domain/repo/auth_repo.dart';
import '../models/sign_up_parameters.dart';

class AuthRepoImp implements AuthRepo {
  @override
  Future<Either> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<Either> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either> signIn(UserModel user) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either> signUp(UserModel user) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
