import 'package:car_fix/config/module.dart';
import 'package:car_fix/pages/chat_service/chat_service_bindings.dart';
import 'package:car_fix/pages/chat_service/chat_service_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class ChatServiceModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/chat_service',
      page: () => const ChatServiceScreen(),
      binding: ChatServiceBindings(),
    ),
  ];
}
