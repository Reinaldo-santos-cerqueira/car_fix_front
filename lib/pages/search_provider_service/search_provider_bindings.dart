import 'package:car_fix/pages/search_provider_service/search_service_provider_controller.dart';
import 'package:get/get.dart';

class SearchServiceProviderBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SearchServiceProviderController(),
    );
  }
}
