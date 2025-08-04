import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/post.dart';

class PostModel extends Post {
  PostModel({
    required super.userId,
    required super.userName,
    required super.postText,
    required super.id,
    super.imageUrl,
    required super.timestamp,
    required super.postLikes,
  });

  Post toEntity() {
    return Post(
      userId: userId,
      userName: userName,
      postText: postText,
      id: id,
      imageUrl: imageUrl,
      timestamp: timestamp,
      postLikes: postLikes,
    );
  }

  factory PostModel.fromEntity(Post post) {
    return PostModel(
      userId: post.userId,
      userName: post.userName,
      postText: post.postText,
      id: post.id,
      imageUrl: post.imageUrl,
      timestamp: post.timestamp,
      postLikes: post.postLikes,
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      userName: json['userName'],
      postText: json['postText'],
      id: json['id'],
      imageUrl: json['imageUrl'],
      timestamp: (json['timestamp'] as Timestamp).toDate(),
      postLikes: List<String>.from(json['postLikes'] ?? []), // ← Fixed type
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'postText': postText,
      'id': id,
      'imageUrl': imageUrl,
      'timestamp': Timestamp.fromDate(timestamp),
      'postLikes': postLikes,
    };
  }


}
