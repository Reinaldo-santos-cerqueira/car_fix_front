import 'package:car_fix/components/app_bar.dart';
import 'package:car_fix/pages/chat_service/chat_service_controller.dart';
import 'package:car_fix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatServiceScreen extends GetView<ChatServiceController> {
  const ChatServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: const AppBarCustom(title: "Chat"),
          backgroundColor: ColorsProject.blackPrimary,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: controller.listMsg.length,
                    itemBuilder: (context, index) {
                      var chatMsg = controller.listMsg[index];
                      return Align(
                        alignment: chatMsg.type == "client"
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          chatMsg.msg.message,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.textEditingControllerMessage,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          fillColor: ColorsProject.grayContrast,
                          filled: true,
                          hintStyle: const TextStyle(
                            color: ColorsProject.gray3,
                          ),
                          hintText: 'Digite uma mensagem...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        controller.sendMessage();
                      },
                      color: Colors.blueAccent,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
