import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qolber_clean_arc/core/dialog/error_dialog.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_bloc.dart';

import 'package:qolber_clean_arc/features/home/view/home_page.dart';
import '../../../core/dialog/loading_dialog.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(builder: (context, state) {


      if (state is HomeStateInitial){
        context.read<HomeBloc>().add(HomeEventFetchAllPosts());

      }
      if (state is HomeStateLoaded){
        return HomePage();
      }
        return Container();
    }, listener: (context, state) {
      if (state is! HomeStateLoading && ModalRoute.of(context)?.isCurrent != true) {
        Navigator.of(context).pop();
      }
      if (state is HomeStateLoading) {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return  Loading();
          },
        );
      }
      if (state is HomeStateError) {
        print("${state.failure}");
        showFirebaseErrorDialog(
            context: context, firestoreFailure: state.failure);
      }
    },);
  }
}
