import 'package:qolber_clean_arc/features/home/domain/entities/coment.dart';

abstract class CommentState {}

class CommentStateLoading extends CommentState {}

class CommentStateError extends CommentState {
  final String message;

  CommentStateError(this.message);
}

class CommentStateLoaded extends CommentState {
  final List<Comment> comments;

  CommentStateLoaded({required this.comments});
}

class CommentStateInitial extends CommentState {}
