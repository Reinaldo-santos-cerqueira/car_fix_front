class LoginModel {
  final String email;
  final String password;
  final String tokenPhone;
  final String type;

  LoginModel({required this.email, required this.password, required this.tokenPhone, required this.type});
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'token_phone': tokenPhone,
      'type': type
    };
  }
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'] as String,
      password: json['password'] as String,
      tokenPhone: json['token_phone']  as String,
      type: json['type']  as String
    );
  }
}