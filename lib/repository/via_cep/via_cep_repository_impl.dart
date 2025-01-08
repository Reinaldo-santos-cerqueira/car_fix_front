import 'dart:convert';
import 'package:car_fix/repository/via_cep/via_cep_repository.dart';
import 'package:http/http.dart' as http;

class ViaCepRepositoryImpl implements ViaCepRepository {
  @override
  Future<Map<String, dynamic>?> getAddress(String cep) async {
    try {
      final Uri url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data.containsKey('erro') ? null : data;
      }

      return null;

    } catch (e) {

      return null;
      
    }
  }
}
