import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    context.read<CommentCubit>().loadComments(widget.postId);
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
          )

        ),
        BlocBuilder<CommentCubit, CommentState>(
          builder: (context, state) {
            if (state is CommentStateLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CommentStateLoaded) {
              final comments = state.comments;
              return ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return ListTile(title: Text(comment.comment));
                },
              );
            } else if (state is CommentStateError) {
              return const Center(child: Text('Ошибка при загрузке комментариев'));
            }
            return const SizedBox.shrink(); // initial
          },
        )
      ],
    );
  }
}
