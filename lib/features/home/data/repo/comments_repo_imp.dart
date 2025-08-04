import 'package:dio/dio.dart';
import 'package:qolber_clean_arc/core/network/dio_client.dart';
import 'package:qolber_clean_arc/features/home/data/models/comment_model.dart';
import 'package:qolber_clean_arc/features/home/domain/entities/coment.dart';
import 'package:qolber_clean_arc/features/home/domain/repository/coment_repo.dart';

import '../../../../servise_locator.dart';

class CommentRepoImp implements CommentRepo {
  @override
  Future<void> addComment(CommentModel comment) async {
    try {
      final response = await sl<DioClient>().post(
          'https://caaa2bf52ecfbcfc74d8.free.beeceptor.com/api/coments/${comment.postId}/${comment.id}',
          data: comment.toJson());
    } on DioException catch (e) {
      print(e.message);
    }
    print('d');
  }

  @override
  Future<void> deleteComment(String postId, String commentId) async {
    try {
      final response = await sl<DioClient>().delete(
          'https://caaa2bf52ecfbcfc74d8.free.beeceptor.com/api/coments/$postId/$commentId');
    } on DioException catch (e) {
      print(e.message);
    }
  }

  @override
  Future<void> editComment(CommentModel editedComment) async {
    try {
      final response = await sl<DioClient>().put(
          'https://caaa2bf52ecfbcfc74d8.free.beeceptor.com/api/coments/${editedComment.postId}/${editedComment.id}',
          data: editedComment.toJson());
    } on DioException catch (e) {
      print(e.message);
    }
  }

  @override
  Future<List<Comment>> getComments(String postId) async {
    try {
      final response = await sl<DioClient>().get(
          'https://caaa2bf52ecfbcfc74d8.free.beeceptor.com/api/coments/$postId/');
      final comments = response.data
          .map((json) => CommentModel.fromJson(json))
          .toList();
      return comments;
    } on DioException catch (e) {
      print(e.message);
    }
    return [];
  }
}
