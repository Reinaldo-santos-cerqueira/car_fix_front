import 'package:http/http.dart' as http;

abstract class UserRepository {
  Future<http.Response> generateToken(String email);

}