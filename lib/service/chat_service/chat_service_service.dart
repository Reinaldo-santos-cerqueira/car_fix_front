import 'package:car_fix/model/chat_service_model.dart';
import 'package:flutter/widgets.dart';

abstract class ChatServiceService {
  Future<List<ChatServiceModel>?> getByServiceRequestedId(
      String id, BuildContext context);
}
