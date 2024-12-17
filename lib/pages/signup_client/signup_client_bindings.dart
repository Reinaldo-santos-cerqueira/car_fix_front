import 'package:car_fix/pages/signup_client/signup_client_controller.dart';
import 'package:get/get.dart';

class SignUpClientBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SignUpClientController(),
    );
  }
}
