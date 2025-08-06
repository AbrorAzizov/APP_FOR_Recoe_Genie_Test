import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';

import 'package:qolber_clean_arc/core/dialog/loading_dialog.dart';
import 'package:qolber_clean_arc/features/home/bloc/comments_bloc/coment_cubit.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_bloc/home_bloc.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_bloc/home_event.dart';
import 'package:qolber_clean_arc/features/home/view/comment_section.dart';

import '../../../core/dialog/delete_dialog.dart';
import '../domain/entities/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  final isMyPost;

  const PostWidget({
    super.key,
    required this.post,
    required this.isMyPost,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Text(
                post.userName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              if(isMyPost)
                IconButton(onPressed: () async {
                  bool result = await showDeleteConfirmationDialog(context);
                  if (result) {
                    return context.read<HomeBloc>().add(
                        HomeEventDeletePost(postId: post.id));
                  }
                }, icon: Icon(Icons.delete))
            ],
          ),
          if (post.imageUrl != null) ...[
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
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
          ],
          SizedBox(height: 10,),
          Text(post.postText,style: TextStyle(
            fontSize: 20
          ),),

          
          SizedBox(height: 5,),
          Row(
            children: [
              IconButton(onPressed: () async {},
                  icon: Icon(Icons.heart_broken, color: Colors.grey,)),
              SizedBox(width: 3,),
              Text(post.postLikes.length.toString()),
              SizedBox(width: 5,),
              IconButton(onPressed: () {},
                  icon: Icon(Icons.message, color: Colors.grey,)),
              SizedBox(width: 3,),
              Text('0'),
              Spacer(),
              Text(DateFormat('dd MMM yyyy, HH:mm').format(post.timestamp)),
            ],
          ),
          SizedBox(height: 20,),
          BlocProvider(create: (context) => CommentCubit()..loadComments(post.id),
          child: CommentSection(postId: post.id,),)
        ],
      ),
    );
  }
}
