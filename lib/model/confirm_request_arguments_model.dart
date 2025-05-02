import 'package:car_fix/model/vehicle_model.dart';

class ConfirmRequestArgumentsModel {
  final String serviceId;
  final double latitude;
  final double longitude;
  VehicleModel? vehicle;

  ConfirmRequestArgumentsModel(this.vehicle, {
    required this.serviceId,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() {
    return {
      'serviceId': serviceId,
      'latitude': latitude,
      'longitude': longitude,
      'vehicle': vehicle?.toJson(),
    };
  }

  factory ConfirmRequestArgumentsModel.fromJson(Map<String, dynamic> json) {
    return ConfirmRequestArgumentsModel(
      json['vehicle'] != null ? VehicleModel.fromJson(json['vehicle']) : null,
      serviceId: json['serviceId'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
