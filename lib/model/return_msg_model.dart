import 'package:car_fix/model/chat_service_model.dart';

class ReturnMsgModel {
  final String? socketIdClient;
  final String? socketIdServiceProvider;
  final ChatServiceModel msg;
  String type;

  ReturnMsgModel({
    required this.socketIdClient,
    required this.socketIdServiceProvider,
    required this.msg,
    required this.type,
  });

  factory ReturnMsgModel.fromJson(Map<String, dynamic> json) {
    return ReturnMsgModel(
      socketIdClient: json['socket_id_client'],
      socketIdServiceProvider: json['socket_id_service_provider'],
      msg: ChatServiceModel.fromJson(json['msg']),
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'socket_id_client': socketIdClient,
      'socket_id_service_provider': socketIdServiceProvider,
      'msg': msg.toJson(),
      'type': type,
    };
  }
}
