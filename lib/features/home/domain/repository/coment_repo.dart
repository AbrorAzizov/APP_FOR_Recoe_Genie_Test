
import 'package:qolber_clean_arc/features/home/data/models/comment_model.dart';
import '../entities/coment.dart';

abstract class CommentRepo {
  Future<void> addComment (CommentModel comment);
  Future<void> deleteComment (String postId, String commentId);
  Future<void> editComment (CommentModel comment);
  Future<List<Comment>> getComments (String postId);

}