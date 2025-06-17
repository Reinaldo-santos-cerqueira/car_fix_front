import 'dart:convert';
import 'package:car_fix/model/chat_args_model.dart';
import 'package:car_fix/model/service_requested_accept_provider.dart';
import 'package:car_fix/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:car_fix/utils/url.dart';

class WaitingServiceProviderController extends GetxController {
  final ServiceRequestedAcceptProviderModel args =
      Get.arguments as ServiceRequestedAcceptProviderModel;
  late final LatLng startPoint;
  late final LatLng endPoint;
  late IO.Socket socket;
  RxList<LatLng> routePoints = <LatLng>[].obs;
  Rx<bool> isLoading = false.obs;
  Rx<String> vehicleMsg = ''.obs;
  final MapController mapController = MapController();

  @override
  void onInit() {
    super.onInit();

    startPoint = LatLng(
      args.latitudeServiceProvider,
      args.longitudeServiceProvider,
    );
    endPoint = LatLng(
      args.latitudeClient,
      args.longitudeClient,
    );
    getRoutePoints();
    for (var vehicle in args.vehicles) {
      if (vehicle.id == args.vehicleServiceProviderId) {
        vehicleMsg.value =
            "${vehicle.mark} ${vehicle.model} ${vehicle.color} Placa: ${vehicle.plate}";
      }
    }
    handleConnect();
  }

  @override
  void onReady() {
    super.onReady();
    fitBounds();
  }

  Future<void> getRoutePoints() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse(
        'https://router.project-osrm.org/route/v1/driving/'
        '${startPoint.longitude},${startPoint.latitude};'
        '${endPoint.longitude},${endPoint.latitude}'
        '?overview=full&geometries=polyline',
      ));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['routes'] != null && data['routes'].isNotEmpty) {
          final String polyline = data['routes'][0]['geometry'];
          routePoints.value = _decodePolyline(polyline);
        } else {
          routePoints.value = [startPoint, endPoint];
        }
      } else {
        _tryAlternativeAPI();
      }
    } catch (e) {
      _tryAlternativeAPI();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _tryAlternativeAPI() async {
    try {
      final response = await http.get(Uri.parse(
        'https://api.openrouteservice.org/v2/directions/driving-car?'
        'api_key=YOUR_API_KEY'
        '&start=${startPoint.longitude},${startPoint.latitude}'
        '&end=${endPoint.longitude},${endPoint.latitude}',
      ));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final String polyline = data['routes'][0]['geometry'];
        routePoints.value = _decodePolyline(polyline);
      } else {
        routePoints.value = [startPoint, endPoint];
      }
    } catch (e) {
      routePoints.value = [startPoint, endPoint];
    }
  }

  List<LatLng> _decodePolyline(String encodedPolyline) {
    List<LatLng> points = [];
    int index = 0, len = encodedPolyline.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encodedPolyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encodedPolyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    if (points.isEmpty) {
      points = [startPoint, endPoint];
    }

    return points;
  }

  void fitBounds() {
    if (routePoints.length >= 2) {
      final bounds = LatLngBounds.fromPoints(routePoints);
      mapController.fitCamera(
        CameraFit.bounds(
          bounds: bounds,
          padding: const EdgeInsets.all(50.0),
        ),
      );
    }
  }

  void handleConnect() {
    socket = IO.io(urlMain, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket.connect();
    socket.emit('change_socket_id', {
      "type": "client",
      "requestedServiceId": args.id,
    });

    socket.on("canceled_service", (msg) {
      showDialogError(
        title: "Corrida cancelada",
        context: Get.context!,
        onPressed: () => Get.offAllNamed("home_client"),
      );
    });
  }

  void handleCanceled() {
    showDialogConfirmation(
      context: Get.context!,
      onConfirm: () {
        if (socket.connected) {
          socket.emit('cancel_service', {
            "serviceRequestedId": args.id,
          });
        }
      },
      title: 'Tem certeza que quer cancelar?',
    );
  }

  void goChatServiceScreen() {
    Get.toNamed(
      "chat_service",
      arguments: ChatArgsModel(
        type: "client",
        socket: socket,
        id: args.id!,
        userIdClient: args.userIdClient,
        userIdProviderService: args.userIdProviderService,
      ),
    );
  }
}
