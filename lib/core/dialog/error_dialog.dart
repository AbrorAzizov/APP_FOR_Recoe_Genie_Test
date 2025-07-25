
import 'package:flutter/material.dart';
import 'package:qolber_clean_arc/core/errors/firestore_failure.dart';


import '../errors/firebase_auth_errors.dart';

Future<void> showFirebaseErrorDialog({
  required BuildContext context,
   AuthError? authError,
  FireStoreFailure? firestoreFailure
}) {
  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierLabel: 'Error',
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (_, __, ___) => Center(
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  authError?.title ?? firestoreFailure!.title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(authError?.message ?? firestoreFailure!.message),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
                    child: const Text('OK', style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
