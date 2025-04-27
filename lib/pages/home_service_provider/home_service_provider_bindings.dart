import 'package:car_fix/pages/home_service_provider/home_service_provider_controller.dart';
import 'package:get/get.dart';

class HomeServiceProviderBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeServiceProviderController(),
    );
  }
}
