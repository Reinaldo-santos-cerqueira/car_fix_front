import 'package:car_fix/repository/services/services_repository.dart';
import 'package:car_fix/utils/url.dart';
import 'package:http/http.dart' as http;

class ServicesRepositoryImpl implements ServicesRepository {
  @override
  Future<http.Response> get() async {
      final Uri url = Uri.parse('$urlMain/service');
      final response = await http.get(url);
      return response;
  }
}
