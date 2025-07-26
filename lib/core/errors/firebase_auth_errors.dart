
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show immutable;


const Map<String, AuthError> authErrorMapping = {
  'The supplied auth credential is incorrect, malformed or has expired': AuthErrorUserNotFound(),
  'weak-password': AuthErrorWeakPassword(),
  'auth/invalid-email': AuthErrorInvalidEmail(),
  'auth/email-already-exists': AuthErrorEmailAlreadyInUse(),
  'operation-not-allowed': AuthErrorOperationNotAllowed(),
  'requires-recent-login': AuthErrorRequiresRecentLogin(),
  'no-current-user': AuthErrorNoCurrentUser(),
};

@immutable
abstract class AuthError {
  final String title;
  final String message;

  const AuthError({
    required this.title,
    required this.message,
  });

  factory AuthError.from(String exception) {
    debugPrint('$exception');
    final code = exception.toLowerCase().trim();
    return authErrorMapping[code] ?? const AuthErrorUnknown();
  }
}

// Default unknown error
@immutable
class AuthErrorUnknown extends AuthError {
  const AuthErrorUnknown()
      : super(
    title: 'Unknown Error',
    message: 'An unknown authentication error occurred.',
  );
}

// Specific error classes

@immutable
class AuthErrorNoCurrentUser extends AuthError {
  const AuthErrorNoCurrentUser()
      : super(
    title: 'No Current User',
    message: 'No user is currently signed in.',
  );
}

@immutable
class AuthErrorRequiresRecentLogin extends AuthError {
  const AuthErrorRequiresRecentLogin()
      : super(
    title: 'Reauthentication Required',
    message: 'Please log in again to perform this action.',
  );
}

@immutable
class AuthErrorOperationNotAllowed extends AuthError {
  const AuthErrorOperationNotAllowed()
      : super(
    title: 'Operation Not Allowed',
    message: 'This sign-in method is currently disabled.',
  );
}

@immutable
class AuthErrorUserNotFound extends AuthError {
  const AuthErrorUserNotFound()
      : super(
    title: 'User Not Found',
    message: 'No account found with the provided credentials.',
  );
}

@immutable
class AuthErrorWeakPassword extends AuthError {
  const AuthErrorWeakPassword()
      : super(
    title: 'Weak Password',
    message: 'Please choose a stronger password.',
  );
}

@immutable
class AuthErrorInvalidEmail extends AuthError {
  const AuthErrorInvalidEmail()
      : super(
    title: 'Invalid Email',
    message: 'Please check your email and try again.',
  );
}

@immutable
class AuthErrorEmailAlreadyInUse extends AuthError {
  const AuthErrorEmailAlreadyInUse()
      : super(
    title: 'Email Already in Use',
    message: 'This email address is already associated with another account.',
  );
}
