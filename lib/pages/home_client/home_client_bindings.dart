import 'package:car_fix/pages/home_client/home_client_controller.dart';
import 'package:get/get.dart';

class HomeClientBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeClientController(),
    );
  }
}
