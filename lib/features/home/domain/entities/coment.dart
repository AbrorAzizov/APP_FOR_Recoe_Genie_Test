import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String id;
  final String userId;
  final String postId;
  final String comment;
  final Timestamp timestamp;

  Comment(
      {required this.timestamp,
      required this.id,
      required this.userId,
      required this.postId,
      required this.comment});
}
