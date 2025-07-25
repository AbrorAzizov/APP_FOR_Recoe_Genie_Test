import 'package:dartz/dartz.dart';

import '../../data/models/signin_params.dart';
import '../../data/models/signup_params.dart';

abstract class AuthRepo {
  Future<Either> signIn (SignInParameters user);
  Future<Either> signUp (SignUpParameters user);
  Future<bool> isLoggedIn ();
  Future<Either> logout();
}