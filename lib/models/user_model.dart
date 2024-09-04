class UserModel {
  String? id;
  String? name;
  String? email;
  String? image;
  String? username;
  String? password;
  String? role;
  String? token;
  
  UserModel({
    this.id,
    this.name,
    this.email,
    this.image,
    this.username,
    this.password,
    this.role,
    this.token,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'username': username,
      'password': password,
      'role': role,
      'token': token,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      image: map['image'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      role: map['role'] as String,
      token: map['token'] as String?,
    );
  }
}
