class UserModel {
  int?id;
  String username;
  String password;
  UserModel({this.id, required this.username, required this.password});
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      password: map['password'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
       'id': id,
      'username': username,
      'password': password,
    };
  }
}