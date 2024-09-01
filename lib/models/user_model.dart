class UserModel {
  int id;
  String name;
  String email;
  String image;
  String username;
  String role;
  String token;
  
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.username,
    required this.role,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'username': username,
      'role': role,
      'token': token,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      image: map['image'] as String,
      username: map['username'] as String,
      role: map['role'] as String,
      token: map['token'] as String,
    );
  }
}
