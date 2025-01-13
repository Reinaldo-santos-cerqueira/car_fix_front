import 'dart:convert';

import 'package:car_fix/repository/user/user_repository.dart';
import 'package:car_fix/utils/url.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImpl implements UserRepository {
  @override
  Future<http.Response> generateToken(String email) async {
    final Uri url = Uri.parse('$urlMain/authentication/generate_token');
    final response = await http.post(url, body: json.encode({"email": email}), headers: {
      'Content-Type': 'application/json',
    });
    return response;
  }

}
