class Post {
  final String id;
  final String userId;
  final String userName;
  final String? imageUrl;
  final double price;
  final DateTime timestamp;
  final String postText;

  Post({
    required this.id,
    required this.userId,
    required this.userName,
    this.imageUrl,
    required this.price,
    required this.timestamp,
    required this.postText,
  });

  Post copyWith({
    String? id,
    String? userId,
    String? userName,
    String? imageUrl,
    double? price,
    DateTime? timestamp,
    String? postText,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      timestamp: timestamp ?? this.timestamp,
      postText: postText ?? this.postText,
    );
  }
}
