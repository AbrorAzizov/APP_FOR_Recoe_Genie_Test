
import 'package:bloc/bloc.dart';
import 'package:qolber_clean_arc/features/home/data/models/comment_model.dart';
import '../../../../servise_locator.dart';
import '../../domain/repository/coment_repo.dart';
import 'coment_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CommentCubit extends Cubit<CommentState> {
  final CommentRepo _commentRepo = sl<CommentRepo>() ;

  CommentCubit() : super(CommentStateInitial());

  Future<void> loadComments(String postId) async {
    emit(CommentStateLoading());
    try {
      final comments = await _commentRepo.getComments(postId);
      emit(CommentStateLoaded(comments: comments));
    } catch (e) {
      emit(CommentStateError('Ошибка при загрузке: $e'));
    }
  }

  Future<void> postComment(CommentModel comment) async {
    emit(CommentStateLoading());
    try {
      await _commentRepo.addComment(comment);
      await loadComments(comment.postId);
    } catch (e) {
      emit(CommentStateError('Ошибка при добавлении: $e'));
    }
  }


  Future<void> deleteComment(String postId, String commentId) async {
    emit(CommentStateLoading());
    try {
      await _commentRepo.deleteComment(postId, commentId);
      await loadComments(postId);
    } catch (e) {
      emit(CommentStateError('Ошибка при удалении: $e'));
    }
  }
}
