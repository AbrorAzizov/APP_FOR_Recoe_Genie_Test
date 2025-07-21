import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qolber_clean_arc/features/auth/bloc/auth_cubit.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_bloc.dart';
import 'package:qolber_clean_arc/servise_locator.dart';

class Injection extends StatelessWidget {
  final Widget child;

  const Injection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => sl<AuthCubit>()..initialize(),
        ),

        BlocProvider<HomeBloc>(
          create: (context) => sl<HomeBloc>(),
        )
      ],
      child: child,
    );
  }
}
