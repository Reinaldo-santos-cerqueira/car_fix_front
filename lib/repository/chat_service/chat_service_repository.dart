import 'package:http/http.dart' as http;

abstract class ChatServiceRepository {
  Future<http.Response> getByServiceRequestedId(String id, String? token);
}
