import 'package:car_fix/pages/pre_login/pre_login_controller.dart';
import 'package:get/get.dart';

class PreLoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      PreLoginController(),
    );
  }
}
