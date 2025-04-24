import 'package:car_fix/model/login_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRepository {
  Future<http.Response> generateToken(String email);
  Future<http.Response> changePassword(String email, String token, String password);
  Future<http.Response> login(LoginModel loginModel);
}