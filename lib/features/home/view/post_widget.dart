import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qolber_clean_arc/core/dialog/loading_dialog.dart';
import 'package:qolber_clean_arc/features/cart/cubit/cart_cubit.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_bloc.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_event.dart';

import '../domain/entities/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.deepPurpleAccent.withOpacity(0.2),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 15,
          ),
          if (post.imageUrl != null) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: CachedNetworkImage(
                  imageUrl: post.imageUrl!,
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(child: Loading()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image),
                ),
              ),
            ),

          ],

          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: const CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  post.userName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  post.price.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,

                  ),
                ),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  post.postText ,
                  style: const TextStyle(fontSize: 15),
                ),
                Row(
                  children: [
                    IconButton(onPressed: () =>context.read<HomeBloc>().add(HomeEventDeletePost(postId: post.id)) , icon: Icon(Icons.delete,color: Colors.red,)),
                    SizedBox(width: 10,),
                    IconButton(onPressed: () =>context.read<CartCubit>().addItem(post) , icon: Icon(Icons.card_travel,color: Colors.amber,)),

                  ],
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
