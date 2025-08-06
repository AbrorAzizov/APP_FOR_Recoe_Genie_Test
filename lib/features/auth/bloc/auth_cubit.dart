import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:qolber_clean_arc/features/auth/bloc/auth_state.dart';

import '../../../servise_locator.dart';

import '../data/models/signin_params.dart';
import '../data/models/signup_params.dart';

import '../domain/repo/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super (AuthStateInitial());


  Future<void> signOut() async {
    final response = await sl<AuthRepo>().logout();
    response.fold((error) =>emit( AuthStateError(authError: error)), (r) => emit(LoggedOut()),);
  }

  Future<void> initialize() async {
    final isLoggedIn = await sl<AuthRepo>().isLoggedIn();
    if (isLoggedIn) {
      emit(AuthStateLoggedIn());
    } else {
      emit(LoggedOut());
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

      final response = await sl<AuthRepo>().signIn(params);

      response.fold((error) {
        emit(AuthStateError(authError: error));
      }, (data) {

        emit(AuthStateLoggedIn());
      });


  }

}