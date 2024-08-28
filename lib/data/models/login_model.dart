class LoginModel {
  final String username;
  final String password;
  LoginModel({
    required this.username,
    required this.password,
  });
  factory LoginModel.fromJson(jsonData) {
    return LoginModel(
      username: jsonData['username'],
      password: jsonData['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
