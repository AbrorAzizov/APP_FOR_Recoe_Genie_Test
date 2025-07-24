
import 'package:flutter/material.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_bloc.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_event.dart';
import 'package:qolber_clean_arc/features/home/view/create_post_page.dart';

import '../../../servise_locator.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
     fetchUser();
  }

  void fetchUser () {
   final homeBloc = sl<HomeBloc>();
    final currentUser = homeBloc.add(HomeEventFetchUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => CreatePostPage()),
        );
      },
      backgroundColor: Color.fromRGBO(49, 39, 79, 1),
      ),
      body: Center(child: Text('data'),),
    );
  }
}
