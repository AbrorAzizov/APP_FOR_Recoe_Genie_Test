import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qolber_clean_arc/features/auth/bloc/auth_cubit.dart';
import 'package:qolber_clean_arc/features/auth/bloc/auth_state.dart';
import 'package:qolber_clean_arc/features/auth/pages/signup_page.dart';
import '../../../core/dialog/error_dialog.dart';
import '../../../core/errors/firebase_auth_errors.dart';
import '../../home/view/home_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is LoggedOut) {
          return SignUpPage();
        }

        if (state is AuthStateLoggedIn) {
          print('hi');
          return HomeView();
        }

        return Container();
      },
      listener: (context, state) async {

        if (state is! AuthStateLoading && ModalRoute.of(context)?.isCurrent != true) {
          Navigator.of(context).pop();
        }

        if (state is AuthStateError) {
          await showFirebaseErrorDialog(
              context: context, authError: AuthError.from(state.authError));
        }
      },
    );
  }
}
