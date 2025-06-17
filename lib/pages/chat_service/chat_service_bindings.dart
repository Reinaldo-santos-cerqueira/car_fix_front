import 'package:car_fix/pages/chat_service/chat_service_controller.dart';
import 'package:car_fix/repository/chat_service/chat_service_repository.dart';
import 'package:car_fix/repository/chat_service/chat_service_repository_impl.dart';
import 'package:car_fix/service/chat_service/chat_service_service.dart';
import 'package:car_fix/service/chat_service/chat_service_service_impl.dart';
import 'package:get/get.dart';

class ChatServiceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatServiceRepository>(
      () => ChatServiceRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<ChatServiceService>(
      () => ChatServiceServiceImpl(chatServiceRepository: Get.find()),
      fenix: true,
    );
    Get.lazyPut<ChatServiceController>(
      () => ChatServiceController(chatServiceService: Get.find()),
    );
  }
}
