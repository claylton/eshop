
class AuthenticateUserModel {
  String username;
  String password;
  
  AuthenticateUserModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory AuthenticateUserModel.fromJson(Map<String, dynamic> map) {
    return AuthenticateUserModel(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

}