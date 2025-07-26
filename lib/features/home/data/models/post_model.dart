import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/post.dart';

class PostModel extends Post{
  PostModel({
    required super.userId,
    required super.userName,
    required super.postText,
    required super.id,
    super.imageUrl,
    required super.timestamp,
    required super.price,
  });

  Post toEntity() {
    return Post(
      userId: userId,
      userName: userName,
      postText: postText,
      id: id,
      imageUrl: imageUrl,
      timestamp: timestamp,
      price: price,
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
      price: post.price,
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      userName: json['userName'],
      postText: json['postText'],
      id: json['id'],
      imageUrl: json['imageUrl'],
      timestamp: (json['timestamp']as Timestamp).toDate(),
      price: (json['price'] ?? 0).toDouble(),

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
      'price': price,
    };
  }

  PostModel copyWith({
    String? userId,
    String? userName,
    String? postText,
    String? id,
    String? imageUrl,
    DateTime? timestamp,
    double? price,
  }) {
    return PostModel(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      postText: postText ?? this.postText,
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      timestamp: timestamp ?? this.timestamp,
      price: price ?? this.price,
    );
  }
}
