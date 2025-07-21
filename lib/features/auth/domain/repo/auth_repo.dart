import 'package:dartz/dartz.dart';
import '../../data/models/sign_up_parameters.dart';

abstract class AuthRepo {
  Future<Either> signIn (UserModel user);
  Future<Either> signUp (UserModel user);
  Future<bool> isLoggedIn ();
  Future<Either> logout();
}