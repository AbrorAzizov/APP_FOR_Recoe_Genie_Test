import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qolber_clean_arc/core/dialog/loading_dialog.dart';
import 'package:qolber_clean_arc/features/home/data/models/comment_model.dart';
import 'package:uuid/uuid.dart';

import '../bloc/comments_bloc/coment_cubit.dart';
import '../bloc/comments_bloc/coment_state.dart';

class CommentSection extends StatefulWidget {
  final String postId;

  const CommentSection({super.key, required this.postId});

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitComment() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final comment = CommentModel(
      id: const Uuid().v4(),
      comment: text,
      postId: widget.postId,
      timestamp: Timestamp.now(),
      userId: '23', // Заменить на актуального пользователя
    );

    context.read<CommentCubit>().postComment(comment);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // серый фон
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Write a comment...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: _submitComment,
              icon: const Icon(Icons.send),
              label: const Text('Send'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        BlocBuilder<CommentCubit, CommentState>(
          builder: (context, state) {
            if (state is CommentStateLoading) {
              return const Center(child: Loading());
            } else if (state is CommentStateLoaded) {
              final comments = state.comments;

              return SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    if(comments.length == 0){

                      return Center(child: Text('no comments yet ',style: TextStyle(fontSize: 20),),);
                    }
                    final comment = comments[index];
                    return ListTile(title: Text(comment.comment));
                  },
                ),
              );
            } else if (state is CommentStateError) {
              return const Center(child: Text('error'));
            }
            return SizedBox(); // initial
          },
        )
      ],
    );
  }
}
