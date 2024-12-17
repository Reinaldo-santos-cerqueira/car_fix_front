import 'package:car_fix/pages/signup_service_provider/signup_service_provider_controller.dart';
import 'package:get/get.dart';

class SignUpServiceProviderBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SignUpServiceProviderController(),
    );
  }
}
