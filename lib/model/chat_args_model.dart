import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatArgsModel {
  final String type;
  final IO.Socket socket;
  final String id;
  final String userIdProviderService;
  final String userIdClient;
  ChatArgsModel({
    required this.type,
    required this.socket,
    required this.id,
    required this.userIdProviderService,
    required this.userIdClient,
  });
}
