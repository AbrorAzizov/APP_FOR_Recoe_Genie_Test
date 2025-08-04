class Post {
  final String id;
  final String userId;
  final String userName;
  final String? imageUrl;
  final List<String> postLikes;
  final DateTime timestamp;
  final String postText;

  Post({
    required this.id,
    required this.userId,
    required this.userName,
    this.imageUrl,
    required this.postLikes,
    required this.timestamp,
    required this.postText,
  });

  Post copyWith({
    String? id,
    String? userId,
    String? userName,
    String? imageUrl,
    List<String>? price, // Updated type
    DateTime? timestamp,
    String? postText,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      imageUrl: imageUrl ?? this.imageUrl,
      postLikes: price ?? this.postLikes, // Updated field
      timestamp: timestamp ?? this.timestamp,
      postText: postText ?? this.postText,
    );
  }
}
