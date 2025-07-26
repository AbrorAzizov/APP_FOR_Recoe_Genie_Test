



abstract class AuthState {}

class LoggedOut extends AuthState{}

class AuthStateInitial extends AuthState{}

class AuthStateLoading  extends AuthState{}

class AuthStateError  extends AuthState{
  final String authError;

  AuthStateError({required this.authError});
}

class AuthStateLoggedIn extends AuthState{}