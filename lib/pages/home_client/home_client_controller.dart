import 'dart:async';

import 'package:car_fix/model/service_model.dart';
import 'package:car_fix/service/services/services_service.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeClientController extends GetxController {
  final ServicesService servicesService;

  HomeClientController({
    required this.servicesService,
  });

  Rx<LatLng> currentPosition = const LatLng(0, 0).obs;
  late MapController mapController;
  Rx<bool> loading = false.obs;
  Rx<String> street = "".obs;
  Rx<String> neighborhood = "".obs;
  final RxList<ServiceModel> listService = <ServiceModel>[].obs;
  final findPosition = false.obs;
  StreamSubscription<Position>? _positionStream;

  @override
  void onInit() async {
    super.onInit();
    mapController = MapController();
    await getServices();
    if (await checkLocationPermission()) {
      getPosition();
    }
  }

  void getPosition() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print("Serviço de localização desativado.");
        return;
      }

      const LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 10,
      );

      _positionStream =
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen((Position? position) async {
        if (position == null) return;

        print("Latitude: ${position.latitude}");
        print("Longitude: ${position.longitude}");

        currentPosition.value = LatLng(position.latitude, position.longitude);
        mapController.move(currentPosition.value, 17.0);

        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks.first;
          street.value = placemark.street ?? "Erro ao encontrar o local";
          neighborhood.value = placemark.subLocality ?? "";
        }
      });

      loading(false);
    } catch (e) {
      print("Erro ao obter o placemark: $e");
    }
  }

  Future<bool> checkLocationPermission() async {
    loading(true);
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      LocationPermission requestedPermission =
          await Geolocator.requestPermission();
      if (requestedPermission != LocationPermission.whileInUse &&
          requestedPermission != LocationPermission.always) {
        return false;
      }
    }
    return true;
  }

  Future<void> getServices() async {
    List<ServiceModel>? listReturnService =
        await servicesService.get(Get.context!);
    listService.value = listReturnService!;
  }

  @override
  void onClose() {
    _positionStream?.cancel();
    super.onClose();
  }
}
