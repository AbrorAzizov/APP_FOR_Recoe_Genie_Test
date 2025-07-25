import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:qolber_clean_arc/features/auth/bloc/auth_state.dart';

import '../../../servise_locator.dart';

import '../data/models/signin_params.dart';
import '../data/models/signup_params.dart';
import '../data/repository/auth_repo_imp.dart';
import '../domain/repo/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super (AuthStateInitial());


  Future<void> signOut() async {
    final response = await sl<AuthRepoImp>().logout();
    response.fold((error) => AuthStateError(authError: error), (r) => AuthStateSignup(),);
  }

  Future<void> initialize() async {
    final isLoggedIn = await sl<AuthRepo>().isLoggedIn();
    if (isLoggedIn) {
      emit(AuthStateLoggedIn());
    } else {
      emit(AuthStateSignup());
    }
  }


  Future<void> sigUp(SignUpParameters param) async {
    emit(AuthStateLoading());

      Either response = await sl<AuthRepo>().signUp(param);
      response.fold((error) {
        emit(AuthStateError(authError: error));
      }, (data) {
        emit(AuthStateLoggedIn());
      });
  }

  Future<void> signIn(SignInParameters params) async {
    emit(AuthStateLoading());

      Either response = await sl<AuthRepo>().signIn(params);
      response.fold((error) {
        emit(AuthStateError(authError: error));
      }, (data) {
        emit(AuthStateLoggedIn());
      });

  }

}