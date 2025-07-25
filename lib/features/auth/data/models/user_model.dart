import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
   UserModel({
    required super.uid,
    required super.email,
    required super.username,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      username: map['username'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
    };
  }
}
