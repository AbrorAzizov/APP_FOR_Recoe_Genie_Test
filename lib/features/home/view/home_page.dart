import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qolber_clean_arc/features/auth/bloc/auth_cubit.dart';
import 'package:qolber_clean_arc/features/cart/view/cart_page.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_bloc.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_state.dart';
import 'package:qolber_clean_arc/features/home/view/create_post_page.dart';
import 'package:qolber_clean_arc/features/home/view/post_widget.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Welcome"),
            actions: [
              IconButton( onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
                  icon: Icon(Icons.shopping_cart_outlined, color: Colors.deepPurpleAccent)),
              IconButton(
                  onPressed: () => context.read<AuthCubit>().signOut(),
                  icon: Icon(Icons.exit_to_app_rounded))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CreatePostPage()),
              );
            }, child: Icon(Icons.add, size: 29, color: Colors.white,),
            backgroundColor: Color.fromRGBO(49, 39, 79, 1),
          ),
          body: SafeArea(
              child: Column(
                children: [
                  Builder(
                    builder: (context) {
                      if (state is HomeStateLoaded) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ListView.builder(
                              itemCount: state.posts.length,
                              itemBuilder: (context, index) {
                                final post = state.posts[index];
                                return PostWidget(post: post);
                              },
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              )));
    });
  }
}
