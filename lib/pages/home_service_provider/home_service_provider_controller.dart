import 'dart:async';

import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeServiceProviderController extends GetxController {
  Rx<LatLng> currentPosition = const LatLng(0, 0).obs;
  late MapController mapController = MapController();
  Rx<bool> loading = false.obs;
  Rx<String> street = "".obs;
  Rx<String> neighborhood = "".obs;
  final findPosition = false.obs;
  StreamSubscription<Position>? _positionStream;

  @override
  void onInit() async {
    super.onInit();
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
    } catch (e) {
      print("Erro ao obter o placemark: $e");
    } finally {
      loading(false);
    }
  }

  Future<bool> checkLocationPermission() async {
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

  @override
  void onClose() {
    _positionStream?.cancel();
    super.onClose();
  }
}
