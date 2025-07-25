import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_bloc.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_state.dart';
import 'package:qolber_clean_arc/features/home/view/create_post_page.dart';

import '../../../servise_locator.dart';
import '../bloc/home_event.dart';
import '../domain/entities/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeBloc = sl<HomeBloc>();
  late final List<Post> posts ;
  @override
  void initState() {
    super.initState();
    _fetchAllPosts();
  }

  Future<void> _fetchAllPosts() async {
    homeBloc.add(HomeEventFetchAllPosts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreatePostPage()),
            );
          },
          backgroundColor: Color.fromRGBO(49, 39, 79, 1),
        ),
        body: SingleChildScrollView(
          child: SafeArea(child: Column(
            children: [
              ListView.builder(
                itemCount: homeBloc.state.
                itemBuilder: (context, index) {

              },)
            ],
          )),
        ),

      );
    });
  }
}
