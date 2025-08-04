import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qolber_clean_arc/core/dialog/loading_dialog.dart';
import 'package:qolber_clean_arc/features/auth/bloc/auth_cubit.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_bloc/home_bloc.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_bloc/home_state.dart';
import 'package:qolber_clean_arc/features/home/view/create_post_page.dart';
import 'package:qolber_clean_arc/features/home/view/post_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool isMyPost;

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Builder(builder: (context) {
        if (state is HomeStateLoaded) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("Welcome"),
                actions: [
                  IconButton(
                      onPressed: () => context.read<AuthCubit>().signOut(),
                      icon: Icon(Icons.exit_to_app_rounded))
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => CreatePostPage(
                              userEntity: state.userEntity,
                            )),
                  );
                },
                child: Icon(
                  Icons.add,
                  size: 29,
                  color: Colors.white,
                ),
                backgroundColor: Color.fromRGBO(49, 39, 79, 1),
              ),
              body: SafeArea(
                  child: Column(
                children: [
                  Builder(
                    builder: (context) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListView.builder(
                            itemCount: state.posts.length,
                            itemBuilder: (context, index) {
                              final post = state.posts[index];
                              final userEntity = state.userEntity;
                              if (post.userId != userEntity.uid) {
                                isMyPost = false;
                              } else {
                                isMyPost = true;
                              }
                              return PostWidget(post: post, isMyPost: isMyPost);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )));
        }else{
          return Center(child: Loading());
        }
      });
    });
  }
}
