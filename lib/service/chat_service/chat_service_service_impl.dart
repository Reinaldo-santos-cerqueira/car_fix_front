import 'dart:convert';

import 'package:car_fix/exception/custom_exception.dart';
import 'package:car_fix/model/chat_service_model.dart';
import 'package:car_fix/repository/chat_service/chat_service_repository.dart';
import 'package:car_fix/service/chat_service/chat_service_service.dart';
import 'package:car_fix/utils/dialogs.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChatServiceServiceImpl extends ChatServiceService {
  ChatServiceRepository chatServiceRepository;

  ChatServiceServiceImpl({required this.chatServiceRepository});

  @override
  Future<List<ChatServiceModel>?> getByServiceRequestedId(
      String id, BuildContext context) async {
    try {
      http.Response response = await chatServiceRepository
          .getByServiceRequestedId(id, await getToken());
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((msg) => ChatServiceModel.fromJson(msg)).toList();
      } else {
        throw CustomException('Erro desconhecido: ${response.statusCode}');
      }
    } catch (e) {
      showDialogError(context: context, title: e.toString());
      return null;
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
