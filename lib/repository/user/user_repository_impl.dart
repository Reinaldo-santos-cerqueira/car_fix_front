import 'dart:convert';

import 'package:car_fix/model/login_model.dart';
import 'package:car_fix/repository/user/user_repository.dart';
import 'package:car_fix/utils/url.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImpl implements UserRepository {
  @override
  Future<http.Response> generateToken(String email) async {
    final Uri url = Uri.parse('$urlMain/users/generate_token');
    final response =
        await http.post(url, body: json.encode({"email": email}), headers: {
      'Content-Type': 'application/json',
    });
    return response;
  }

  @override
  Future<http.Response> changePassword(
      String email, String token, String password) async {
    final Uri url = Uri.parse('$urlMain/users/change_password');
    final response = await http.patch(url,
        body: json.encode({
          "email": email,
          "tokenPasswordChange": token,
          "password": password,
        }),
        headers: {
          'Content-Type': 'application/json',
        });
    return response;
  }

  @override
  Future<http.Response> login(
      LoginModel loginModel) async {
    if(loginModel.type == "client"){
      final Uri url = Uri.parse('$urlMain/users/login/client');
      final response = await http.post(url,
          body: json.encode(loginModel),
          headers: {
            'Content-Type': 'application/json',
          });
      return response;
    }else {
      final Uri url = Uri.parse('$urlMain/users/login/service_provider');
      final response = await http.post(url,
          body: json.encode(loginModel),
          headers: {
            'Content-Type': 'application/json',
          });
      return response;
    }
  }
}
