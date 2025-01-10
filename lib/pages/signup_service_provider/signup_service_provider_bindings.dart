import 'package:car_fix/pages/signup_service_provider/signup_service_provider_controller.dart';
import 'package:car_fix/repository/service_provider/service_provider_repository.dart';
import 'package:car_fix/repository/service_provider/service_provider_repository_impl.dart';
import 'package:car_fix/repository/services/services_repository.dart';
import 'package:car_fix/repository/services/services_repository_impl.dart';
import 'package:car_fix/repository/via_cep/via_cep_repository.dart';
import 'package:car_fix/repository/via_cep/via_cep_repository_impl.dart';
import 'package:car_fix/service/service_provider/service_provider_service.dart';
import 'package:car_fix/service/service_provider/service_provider_service_impl.dart';
import 'package:car_fix/service/services/services_service.dart';
import 'package:car_fix/service/services/services_service_impl.dart';
import 'package:car_fix/service/via_cep/via_cep_service.dart';
import 'package:car_fix/service/via_cep/via_cep_service_impl.dart';
import 'package:get/get.dart';

class SignUpServiceProviderBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViaCepRepository>(
      () => ViaCepRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<ViaCepService>(
      () => ViaCepServiceImpl(
        viaCepRepository: Get.find(),
      ),
      fenix: true,
    );

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

    Get.lazyPut<ServiceProviderRepository>(
      () => ServiceProviderRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<ServiceProviderService>(
      () => ServiceProviderServiceImpl(
        serviceProviderRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut(
      () => SignUpServiceProviderController(
        viaCepService: Get.find(),
        servicesService: Get.find(),
        serviceProviderService: Get.find(),
      ),
    );
  }
}
