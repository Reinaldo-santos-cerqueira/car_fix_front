import 'package:http/http.dart' as http;

abstract class VehicleRepository {
  Future<http.Response> get(String? token);
}