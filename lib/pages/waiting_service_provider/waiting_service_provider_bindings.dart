import 'package:car_fix/pages/waiting_service_provider/waiting_service_provider_controller.dart';
import 'package:get/get.dart';

class WaitingServiceProviderBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      WaitingServiceProviderController(),
    );
  }
}
