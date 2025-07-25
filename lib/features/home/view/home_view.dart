import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qolber_clean_arc/core/dialog/error_dialog.dart';
import 'package:qolber_clean_arc/core/dialog/loaing_page.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_bloc.dart';
import '../bloc/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeStateLoading) {
        return  LoadingPage();
      }

      return Container();
    }, listener: (context, state) {


      if (state is HomeStateError) {
        showFirebaseErrorDialog(context: context, firestoreFailure: state.failure);
      }
    },);
  }
}
