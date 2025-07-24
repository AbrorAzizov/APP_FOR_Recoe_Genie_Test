import '../../domain/entities/post.dart';

class PostModel {
  final String userId;
  final String userName; // ← Add this
  final String postText;
  final String id;
  final String? imageUrl;
  final DateTime timestamp;
  final double price;

  PostModel({
    required this.userId,
    required this.userName,
    required this.postText,
    required this.id,
    this.imageUrl,
    required this.timestamp,
    required this.price,
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
      timestamp: DateTime.parse(json['timestamp']),
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'postText': postText,
      'id': id,
      'imageUrl': imageUrl,
      'timestamp': timestamp.toIso8601String(),
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
