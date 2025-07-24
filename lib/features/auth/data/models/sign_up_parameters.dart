
class UserModel {
  final String password;
  final String email;
  final String? name;
  final String? uid;

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
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> e) {
    return UserModel(
      password: e['password'],
      email: e['email']as String,
      name: e['name'],
      uid: e['uid'],
    );
  }

}

