import 'package:flutter/cupertino.dart';
import 'package:qolber_clean_arc/servise_locator.dart';

class Injection extends StatelessWidget {
  const Injection({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => sl<AuthCubit>()..initialize(),
        ),

      ],
      child: MaterialApp(
        home: AuthView(),
      ),
    );
  }
}
