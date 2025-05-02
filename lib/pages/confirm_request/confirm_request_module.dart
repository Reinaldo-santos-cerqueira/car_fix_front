import 'package:car_fix/config/module.dart';
import 'package:car_fix/pages/confirm_request/confirm_request_bindings.dart';
import 'package:car_fix/pages/confirm_request/confirm_request_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class ConfirmRequestModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/confirm_request',
      page: () => const ConfirmRequestScreen(),
      binding: ConfirmRequestBindings(),
    ),
  ];
}
