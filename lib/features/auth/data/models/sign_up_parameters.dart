import '../../domain/entity/user_entity.dart';

class UserModel {
  final String? password;
  final String email;
  final String name;

  UserModel({
    required this.password,
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'name': name ,
    };
  }

  factory UserModel.fromMap(Map<String,dynamic> e){
    return UserModel(password: e['password'], email: e['email'],name: e['name']);
  }

  User toEntity(){
    return User(email: email,username: name);
  }

}



