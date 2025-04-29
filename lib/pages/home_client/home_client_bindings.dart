import 'package:car_fix/pages/home_client/home_client_controller.dart';
import 'package:car_fix/repository/services/services_repository.dart';
import 'package:car_fix/repository/services/services_repository_impl.dart';
import 'package:car_fix/service/services/services_service.dart';
import 'package:car_fix/service/services/services_service_impl.dart';
import 'package:get/get.dart';

class HomeClientBindings implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ServicesRepository>(
          () => ServicesRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<ServicesService>(
          () => ServicesServiceImpl(
        servicesRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
        ()=>HomeClientController(
        servicesService: Get.find()
      ),
    );
  }
}
