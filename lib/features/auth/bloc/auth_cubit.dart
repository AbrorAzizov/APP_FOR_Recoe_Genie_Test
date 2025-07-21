import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:qolber_clean_arc/features/auth/bloc/auth_state.dart';

import '../../../servise_locator.dart';
import '../data/models/sign_up_parameters.dart';
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


  Future<void> sigUp(UserModel user) async {
    emit(AuthStateLoading());
    try {
      Either response = await sl<AuthRepoImp>().signUp(user);
      response.fold((error) {
        emit(AuthStateError(authError: error));
      }, (data) {
        emit(AuthStateLoggedIn());
      });
    } catch (e) {
      emit(AuthStateError(authError: "$e"));
    }
  }

  Future<void> signIn(UserModel userModel) async {
    emit(AuthStateLoading());
    try {
      Either response = await sl<AuthRepoImp>().signIn(userModel);
      response.fold((error) {
        emit(AuthStateError(authError: error));
      }, (data) {
        emit(AuthStateLoggedIn());
      });
    } catch (e) {
      emit(AuthStateError(authError: "$e"));
    }
  }

}