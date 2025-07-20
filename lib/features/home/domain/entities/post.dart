class Post {
  final String id;
  final String userId;
  final String userName;
  final String? imageUrl;
  final DateTime timestamp;


  Post(
      {required this.userId,
        required this.userName,
        required this.id,
         this.imageUrl,
        required this.timestamp}
      );

  Post copyWith({
    String? id,
    String? userId,
    String? userName,
    String? imageUrl,
    DateTime? timestamp,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      imageUrl: imageUrl ?? this.imageUrl,
      timestamp: timestamp ?? this.timestamp,
    );
  }

}