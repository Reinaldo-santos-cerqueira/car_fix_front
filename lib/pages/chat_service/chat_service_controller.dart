import 'package:car_fix/model/chat_args_model.dart';
import 'package:car_fix/model/chat_service_model.dart';
import 'package:car_fix/model/return_msg_model.dart';
import 'package:car_fix/service/chat_service/chat_service_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatServiceController extends GetxController {
  final ChatArgsModel args = Get.arguments as ChatArgsModel;
  TextEditingController textEditingControllerMessage = TextEditingController();
  RxList<ReturnMsgModel> listMsg = <ReturnMsgModel>[].obs;
  final isRecording = false.obs;
  ChatServiceService chatServiceService;

  ChatServiceController({required this.chatServiceService});

  @override
  void onInit() {
    super.onInit();
    getMsg();
    // requestPermission();
    args.socket.on(
      "received_message",
      (msg) {
        final returnMsg =
            ReturnMsgModel.fromJson(Map<String, dynamic>.from(msg));
        listMsg.insert(0, returnMsg);
      },
    );
  }

  void sendMessage() {
    args.socket.emit("message", {
      "msg": textEditingControllerMessage.text,
      "type": "client",
      "service_requested_id": args.id
    });
    textEditingControllerMessage.text = "";
  }

  Future<void> getMsg() async {
    List<ChatServiceModel>? chatServiceList =
        await chatServiceService.getByServiceRequestedId(args.id, Get.context!);
    List<ReturnMsgModel> listReturnVehicle = [];
    if (chatServiceList != null) {
      for (var chatService in chatServiceList) {
        var type = "";
        if (chatService.senderId == args.userIdClient) {
          type = "client";
        } else {
          type = "service_provider";
        }
        ReturnMsgModel returnMsgModel = new ReturnMsgModel(
          msg: chatService,
          socketIdClient: "",
          socketIdServiceProvider: "",
          type: type,
        );
        listReturnVehicle.add(returnMsgModel);
      }
    }
    listMsg.addAll(listReturnVehicle);
  }
}
