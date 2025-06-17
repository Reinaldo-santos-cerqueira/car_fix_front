import 'package:car_fix/repository/chat_service/chat_service_repository.dart';
import 'package:car_fix/utils/url.dart';
import 'package:http/http.dart' as http;

class ChatServiceRepositoryImpl implements ChatServiceRepository {
  @override
  Future<http.Response> getByServiceRequestedId(
      String id, String? token) async {
    final Uri url = Uri.parse('$urlMain/chatService/$id');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    return response;
  }
}
