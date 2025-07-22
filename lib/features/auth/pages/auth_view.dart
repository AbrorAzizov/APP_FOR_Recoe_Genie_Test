import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qolber_clean_arc/core/dialog/loading_dialog.dart';
import 'package:qolber_clean_arc/features/auth/bloc/auth_cubit.dart';
import 'package:qolber_clean_arc/features/auth/bloc/auth_state.dart';
import 'package:qolber_clean_arc/features/auth/pages/login_page.dart';
import 'package:qolber_clean_arc/features/home/view/home_page.dart';

import '../../../core/dialog/error_dialog.dart';
import '../../../core/errors/firebase_auth_errors.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
       if (state is AuthStateSignup){
         return SignUpPage();
       }
       if  (state is AuthStateLoggedIn){
         return HomePage();
       }
    }, listener: (context, state) {
      if (state is AuthStateLoading) {
        Loading();
      }
      if (state is AuthStateError) {
        showFirebaseErrorDialog(
            context: context, authError: AuthError.from(state.authError));
      }
    },);
  }
}
