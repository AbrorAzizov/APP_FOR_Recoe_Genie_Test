import 'package:flutter/foundation.dart' show immutable;

const Map<String, FireStoreFailure> fireStoreFailureMapping = {
  'permission-denied': FireStorePermissionDenied(),
  'unavailable': FireStoreUnavailable(),
  'cancelled': FireStoreCancelled(),
  'not-found': FireStoreNotFound(),
  'deadline-exceeded': FireStoreDeadlineExceeded(),
};

@immutable
abstract class FireStoreFailure {
  final String title;
  final String message;

  const FireStoreFailure({
    required this.title,
    required this.message,
  });

  factory FireStoreFailure.fromExeption(String code) {
    final key = code.toLowerCase().trim();
    return fireStoreFailureMapping[key] ?? const FireStoreUnknown();
  }
}

// --- Specific error types ---

class FireStorePermissionDenied extends FireStoreFailure {
  const FireStorePermissionDenied()
      : super(
    title: 'Permission Denied',
    message: 'You don’t have permission to perform this operation.',
  );
}

class FireStoreUnavailable extends FireStoreFailure {
  const FireStoreUnavailable()
      : super(
    title: 'Service Unavailable',
    message: 'The Firestore service is temporarily unavailable.',
  );
}

class FireStoreCancelled extends FireStoreFailure {
  const FireStoreCancelled()
      : super(
    title: 'Request Cancelled',
    message: 'The request to Firestore was cancelled.',
  );
}

class FireStoreNotFound extends FireStoreFailure {
  const FireStoreNotFound()
      : super(
    title: 'Not Found',
    message: 'The requested document was not found.',
  );
}

class FireStoreDeadlineExceeded extends FireStoreFailure {
  const FireStoreDeadlineExceeded()
      : super(
    title: 'Timeout',
    message: 'The operation took too long to complete.',
  );
}

class FireStoreUnknown extends FireStoreFailure {
  const FireStoreUnknown()
      : super(
    title: 'Unknown Firestore Error',
    message: 'An unknown error occurred with Firestore.',
  );
}
