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
}