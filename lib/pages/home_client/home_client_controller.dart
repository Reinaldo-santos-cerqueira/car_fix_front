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

  @override
  void onInit() async{
    super.onInit();
    mapController = MapController();
    checkLocationPermission();
    await getServices();
  }

  void getPosition() async {
    try {
      const LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 10,
      );
      Geolocator.getPositionStream(
        locationSettings: locationSettings,
      ).listen((Position position) async {
        currentPosition.value = LatLng(position.latitude, position.longitude);
        mapController.move(currentPosition.value, 17.0);
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks.first;
          street(placemark.street ?? "Erro ao encontrar o local");
          neighborhood(placemark.subLocality ?? "");
        }
      });
      loading(false);
    } catch (e) {
      print("Erro ao obter o placemark: $e");
    }
  }

  void checkLocationPermission() async {
    loading(true);
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      LocationPermission requestedPermission =
          await Geolocator.requestPermission();
      if (requestedPermission != LocationPermission.whileInUse &&
          requestedPermission != LocationPermission.always) {
        return;
      }
    }
    getPosition();
  }

  Future<void> getServices() async {
    List<ServiceModel>? listReturnService =
        await servicesService.get(Get.context!);
    listService.value = listReturnService!;
  }
}
