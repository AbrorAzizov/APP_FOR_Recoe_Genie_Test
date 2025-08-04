
import 'package:flutter/material.dart';
import 'package:qolber_clean_arc/core/errors/firestore_failure.dart';


import '../errors/firebase_auth_errors.dart';

Future<void> showFirebaseErrorDialog({
  required BuildContext context,
   AuthError? authError,
  FireStoreFailure? firestoreFailure
}) {return showDialog<void>(
  context: context,
  barrierDismissible: false, // Не закрывается по тапу вне диалога
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text(
        authError?.title ?? firestoreFailure!.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(authError?.message ?? firestoreFailure!.message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'OK',
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  },
);

}

