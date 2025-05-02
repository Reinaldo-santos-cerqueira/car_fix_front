import 'package:car_fix/model/confirm_request_arguments_model.dart';
import 'package:car_fix/model/vehicle_model.dart';
import 'package:car_fix/service/vehicle/vehicle_service.dart';
import 'package:car_fix/utils/dialogs.dart';
import 'package:get/get.dart';

class ConfirmRequestController extends GetxController {
  VehicleService vehicleService;

  ConfirmRequestController({required this.vehicleService});

  final RxList<VehicleModel> vehicles = <VehicleModel>[].obs;
  final Rx<String> vehicleSelect = "".obs;

  @override
  void onInit() async {
    super.onInit();
    await getVehicles();
  }

  Future<void> getVehicles() async {
    List<VehicleModel>? listReturnVehicle =
        await vehicleService.get(Get.context!);
    vehicles.value = listReturnVehicle!;
  }

  void selectVehicle(String id){
    vehicleSelect.value = id;
  }

  void validVehicleAndGoToSearchServiceProvider(ConfirmRequestArgumentsModel args){
    if(vehicleSelect.value == ""){
      showDialogError(
        title: "Escolha um veiculo",
        context: Get.context!,
      );
      return;
    }
    vehicles.forEach((vehicle) {
      if (vehicleSelect.value == vehicle.id) {
        args.vehicle = vehicle;
      }
    });
    Get.toNamed("/search_service_provider",arguments: args);
  }
}
