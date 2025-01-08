import 'package:car_fix/pages/signup_client/signup_client_controller.dart';
import 'package:car_fix/repository/client/client_repository.dart';
import 'package:car_fix/repository/client/client_repository_impl.dart';
import 'package:car_fix/repository/via_cep/via_cep_repository.dart';
import 'package:car_fix/repository/via_cep/via_cep_repository_impl.dart';
import 'package:car_fix/service/client/client_service.dart';
import 'package:car_fix/service/client/client_service_impl.dart';
import 'package:car_fix/service/via_cep/via_cep_service.dart';
import 'package:car_fix/service/via_cep/via_cep_service_impl.dart';
import 'package:get/get.dart';

class SignUpClientBindings implements Bindings {
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

    Get.lazyPut<ClientRepository>(
      () => ClientRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<ClientService>(
      () => ClientServiceImpl(
        clientRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut(
      () => SignUpClientController(
        viaCepService: Get.find(),
        clientService: Get.find()
      ),
    );
  }
}
