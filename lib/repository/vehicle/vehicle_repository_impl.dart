import 'package:car_fix/repository/vehicle/vehicle_repository.dart';
import 'package:car_fix/utils/url.dart';
import 'package:http/http.dart' as http;

class VehicleRepositoryImpl implements VehicleRepository {
  @override
  Future<http.Response> get(String? token) async {
    final Uri url = Uri.parse('$urlMain/vehicle');
    final response = await http.get(url,headers: {
      'Authorization': 'Bearer $token',
    });
    return response;
  }
}
