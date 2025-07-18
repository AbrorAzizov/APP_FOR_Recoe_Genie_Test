import '../../domain/entities/post.dart';

class PostModel {
  final String userId;
  final String userName;
  final String id;
  final String? imageUrl;
  final DateTime timestamp;

  PostModel({
    required this.userId,
    required this.userName,
    required this.id,
     this.imageUrl,
    required this.timestamp,
  });


  Post toEntity() {
    return Post(
      userId: userId,
      userName: userName,
      id: id,
      imageUrl: imageUrl,
      timestamp: timestamp,
    );
  }


  factory PostModel.fromEntity(Post post) {
    return PostModel(
      userId: post.userId,
      userName: post.userName,
      id: post.id,
      imageUrl: post.imageUrl,
      timestamp: post.timestamp,
    );
  }


  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      userName: json['userName'],
      id: json['id'],
      imageUrl: json['imageUrl'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'id': id,
      'imageUrl': imageUrl,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  // Optional: `copyWith`
  PostModel copyWith({
    String? userId,
    String? userName,
    String? id,
    String? imageUrl,
    DateTime? timestamp,
  }) {
    return PostModel(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
