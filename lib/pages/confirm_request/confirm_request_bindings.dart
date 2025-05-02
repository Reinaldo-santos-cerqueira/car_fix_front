import 'package:car_fix/repository/vehicle/vehicle_repository.dart';
import 'package:car_fix/repository/vehicle/vehicle_repository_impl.dart';
import 'package:car_fix/service/vehicle/vehicle_service.dart';
import 'package:car_fix/service/vehicle/vehicle_service_impl.dart';
import 'package:get/get.dart';
import 'package:car_fix/pages/confirm_request/confirm_request_controller.dart';

class ConfirmRequestBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VehicleRepository>(
          () => VehicleRepositoryImpl(),
      fenix: true,
    );

    Get.lazyPut<VehicleService>(
          () => VehicleServiceImpl(vehicleRepository: Get.find()),
      fenix: true,
    );
    
    Get.lazyPut<ConfirmRequestController>(
      () => ConfirmRequestController(
        vehicleService: Get.find()
      ),
    );
  }
}
