class CreateUserModel {
  String? name;
  String? email;
  String? username;
  String? password;
  
  CreateUserModel({
    this.name,
    this.email,
    this.username,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'username': username,
      'password': password,
    };
  }

  factory CreateUserModel.fromJson(Map<String, dynamic> map) {
    return CreateUserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }
}
