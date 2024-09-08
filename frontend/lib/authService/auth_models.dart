class UserModel {
  final String? username;
  final String? email;
  final String? password1;
  final String? password2;

  UserModel({
    this.username,
    this.email,
    this.password1,
    this.password2,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        email = json['email'],
        password1 = json['password1'],
        password2 = json['password2'];

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password1': password1,
      'password2': password2,
    };
  }
}