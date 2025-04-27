import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeClientController extends GetxController {
  Rx<LatLng> currentPosition = const LatLng(0, 0).obs;
  late MapController mapController;
  Rx<bool> loading = false.obs;
  Rx<String> street = "".obs;
  Rx<String> neighborhood = "".obs;

  @override
  void onInit() {
    super.onInit();
    mapController = MapController();
    checkLocationPermission();
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
}
