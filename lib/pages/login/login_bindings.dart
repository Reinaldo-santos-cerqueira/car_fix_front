import 'package:car_fix/pages/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      LoginController(),
    );
  }
}
