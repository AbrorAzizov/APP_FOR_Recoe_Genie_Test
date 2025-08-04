import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qolber_clean_arc/features/home/domain/entities/coment.dart';

class CommentModel extends Comment {
  CommentModel(
      {required super.timestamp,
      required super.id,
      required super.userId,
      required super.postId,
      required super.comment,
      });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      postId: json['postId'] ?? '',
      comment: json['comment'] ?? '',
      timestamp: json['timestamp'] is Timestamp
          ? json['timestamp']
          : Timestamp.fromMillisecondsSinceEpoch(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'postId': postId,
      'comment': comment,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }
}
