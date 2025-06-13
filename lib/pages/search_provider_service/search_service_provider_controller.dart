import 'dart:async';

import 'package:car_fix/model/confirm_request_arguments_model.dart';
import 'package:car_fix/model/service_requested_accept_provider.dart';
import 'package:car_fix/utils/url.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SearchServiceProviderController extends GetxController {
  final Rx<String?> userId = "".obs;
  final Rx<String?> serviceRequestedId = "".obs;
  late IO.Socket socket;
  final ConfirmRequestArgumentsModel args =
      Get.arguments as ConfirmRequestArgumentsModel;
  final RxList<ServiceRequestedAcceptProviderModel>
      listServiceRequestedAcceptProviderModel =
      <ServiceRequestedAcceptProviderModel>[].obs;
  late Timer timer;
  final Rx<ServiceRequestedAcceptProviderModel>
      selectedServiceRequestedAcceptProviderModel =
      ServiceRequestedAcceptProviderModel.empty().obs;
  @override
  void onInit() async {
    super.onInit();
    final prefs = await SharedPreferences.getInstance();
    userId.value = prefs.getString('userId');
    socket = IO.io(urlMain, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket.connect();

    socket.onConnect((_) {
      if (listServiceRequestedAcceptProviderModel.isEmpty) {
        requestService();
      }
    });

    socket.on("accepted_service", (msg) {
      ServiceRequestedAcceptProviderModel serviceRequestedAcceptProvider =
          ServiceRequestedAcceptProviderModel.fromMap(msg);
      listServiceRequestedAcceptProviderModel
          .add(serviceRequestedAcceptProvider);
      print(msg);
    });

    socket.on("received_service", (msg) {
      serviceRequestedId.value = msg["id"];
    });

    socket.on("confirmed_start_service", (msg) {
      selectedServiceRequestedAcceptProviderModel.value.id =
          serviceRequestedId.value;
      Get.offAllNamed("/waiting_service_provider",
          arguments: selectedServiceRequestedAcceptProviderModel.value);
    });

    timer = Timer.periodic(const Duration(minutes: 2), (timer) {
      if (listServiceRequestedAcceptProviderModel.isEmpty) {
        requestService();
      }
    });
  }

  void requestService() {
    if (serviceRequestedId.value == "") {
      socket.emit('request_service', {
        "service_id": args.serviceId,
        "user_id_client": userId.value,
        "latitude_client": args.latitude,
        "longitude_client": args.longitude,
        "status": 0,
        "vehicle_id_client": args.vehicle!.id
      });
    } else {
      socket.emit('request_service', {
        "service_id": args.serviceId,
        "user_id_client": userId.value,
        "latitude_client": args.latitude,
        "longitude_client": args.longitude,
        "status": 0,
        "vehicle_id_client": args.vehicle!.id,
        "id": serviceRequestedId.value
      });
    }
  }

  void acceptRequestClient(
      ServiceRequestedAcceptProviderModel
          selectedServiceRequestedAcceptProvider) {
    selectedServiceRequestedAcceptProviderModel.value =
        selectedServiceRequestedAcceptProvider;
    socket.emit('accept_service_client',
        {"serviceRequestedId": serviceRequestedId.value, "status": 2});
  }

  @override
  void onClose() {
    // socket.dispose();
    super.onClose();
  }
}
