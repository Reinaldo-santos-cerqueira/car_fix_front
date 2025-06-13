import 'package:car_fix/model/vehicle_model.dart';

class ServiceRequestedAcceptProviderModel {
  String? id;
  final int distance;
  final int duration;
  final String requestedServiceId;
  final String userIdProviderService;
  final String serviceId;
  final String userIdClient;
  final int status;
  final double latitudeClient;
  final double longitudeClient;
  final double latitudeServiceProvider;
  final double longitudeServiceProvider;
  final String serviceProviderSocketIoId;
  final String userIdSocketIoId;
  final String vehicleIdClient;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String serviceProviderId;
  final String fullName;
  final String phoneNumber;
  final String identifier;
  final String pathProfileImage;
  final List<VehicleModel> vehicles;
  final double valueService;
  final String? vehicleServiceProviderId;

  ServiceRequestedAcceptProviderModel(
    this.id, {
    required this.distance,
    required this.duration,
    required this.requestedServiceId,
    required this.userIdProviderService,
    required this.serviceId,
    required this.userIdClient,
    required this.status,
    required this.latitudeClient,
    required this.longitudeClient,
    required this.latitudeServiceProvider,
    required this.longitudeServiceProvider,
    required this.serviceProviderSocketIoId,
    required this.userIdSocketIoId,
    required this.vehicleIdClient,
    required this.createdAt,
    required this.updatedAt,
    required this.serviceProviderId,
    required this.fullName,
    required this.phoneNumber,
    required this.identifier,
    required this.pathProfileImage,
    required this.vehicles,
    required this.valueService,
    required this.vehicleServiceProviderId,
  });

  factory ServiceRequestedAcceptProviderModel.fromMap(
      Map<String, dynamic> map) {
    var vehiclesList = map['serviceProvider']['Vehicle'] as List;
    List<VehicleModel> vehicles =
        vehiclesList.map((i) => VehicleModel.fromJson(i)).toList();
    return ServiceRequestedAcceptProviderModel(map['id'],
        distance: map['distance'],
        duration: map['duration'],
        requestedServiceId: map['requestedService']['id'],
        userIdProviderService: map['requestedService']
            ['user_id_provider_service'],
        serviceId: map['requestedService']['service_id'],
        userIdClient: map['requestedService']['user_id_client'],
        status: map['requestedService']['status'],
        latitudeClient: map['requestedService']['latitude_client'],
        longitudeClient: map['requestedService']['longitude_client'],
        latitudeServiceProvider: map['requestedService']
            ['latitude_service_provider'],
        longitudeServiceProvider: map['requestedService']
            ['longitude_service_provider'],
        serviceProviderSocketIoId: map['requestedService']
            ['service_provider_socket_io_id'],
        userIdSocketIoId: map['requestedService']['user_id_socket_io_id'],
        vehicleIdClient: map['requestedService']['vehicle_id_client'],
        createdAt: DateTime.parse(map['requestedService']['created_at']),
        updatedAt: DateTime.parse(map['requestedService']['updated_at']),
        serviceProviderId: map['serviceProvider']['id'],
        fullName: map['serviceProvider']['full_name'],
        phoneNumber: map['serviceProvider']['phone_number'],
        identifier: map['serviceProvider']['identifier'],
        pathProfileImage: map['serviceProvider']['path_profile_image'],
        vehicles: vehicles,
        vehicleServiceProviderId: map['requestedService']
            ['vehicle_id_service_provider'],
        valueService: (map['valueService'] as num).toDouble());
  }

  // Convert ServiceRequestedAccepted object to Map
  Map<String, dynamic> toMap() {
    return {
      'distance': distance,
      'duration': duration,
      'requestedService': {
        'id': requestedServiceId,
        'user_id_provider_service': userIdProviderService,
        'service_id': serviceId,
        'user_id_client': userIdClient,
        'status': status,
        'latitude_client': latitudeClient,
        'longitude_client': longitudeClient,
        'latitude_service_provider': latitudeServiceProvider,
        'longitude_service_provider': longitudeServiceProvider,
        'service_provider_socket_io_id': serviceProviderSocketIoId,
        'user_id_socket_io_id': userIdSocketIoId,
        'vehicle_id_client': vehicleIdClient,
        'vehicle_id_service_provider': vehicleServiceProviderId,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      },
      'serviceProvider': {
        'id': serviceProviderId,
        'full_name': fullName,
        'phone_number': phoneNumber,
        'identifier': identifier,
        'path_profile_image': pathProfileImage,
      },
      'vehicles': vehicles.map((v) => v.toJson()).toList(),
      'valueService': valueService
    };
  }

  factory ServiceRequestedAcceptProviderModel.empty() {
    return ServiceRequestedAcceptProviderModel(
      null,
      distance: 0,
      duration: 0,
      requestedServiceId: '',
      userIdProviderService: '',
      serviceId: '',
      userIdClient: '',
      status: 0,
      latitudeClient: 0.0,
      longitudeClient: 0.0,
      latitudeServiceProvider: 0.0,
      longitudeServiceProvider: 0.0,
      serviceProviderSocketIoId: '',
      userIdSocketIoId: '',
      vehicleIdClient: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      serviceProviderId: '',
      fullName: '',
      phoneNumber: '',
      identifier: '',
      pathProfileImage: '',
      vehicles: [],
      valueService: 0.0,
      vehicleServiceProviderId: null,
    );
  }
}
