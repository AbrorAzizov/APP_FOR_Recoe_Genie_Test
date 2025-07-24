import '../../domain/entity/user_entity.dart';

class UserModel {
  final String password;
  final String email;
  final String? name;
  final String? uid; // теперь uid nullable

  UserModel({
    required this.password,
    required this.email,
    this.name,
    this.uid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'name': name,
      'uid': uid, // добавлен
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> e) {
    return UserModel(
      password: e['password'],
      email: e['email'],
      name: e['name'],
      uid: e['uid'], // может быть null
    );
  }

}

